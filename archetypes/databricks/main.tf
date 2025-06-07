locals {
  spark_conf = merge(var.spark_conf,
    { for s in var.secrets : "spark.${s.scope}.${s.key}" => "{{secrets/${s.scope}/${s.key}}}" },
    { "spark.databricks.secureVariableSubstitute.enabled" = "false" }
  )

  spark_version = "14.3.x-scala2.12"

  deploy_pe = try(var.private_endpoint.enabled, false)
}

module "naming" {
  source = "../../modules/naming"
  prefix = var.naming.prefix
  suffix = var.naming.suffix
}

module "databricks" {
  source = "../../modules/databricks"

  location                   = var.location
  resource_group_name        = var.resource_group_name
  databricks_workspace_name  = module.naming.databricks_workspace.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  vnet                       = var.vnet
  private_endpoint           = local.deploy_pe ? { name = "${module.naming.private_endpoint.name}-backend", subnet_id = var.private_endpoint.subnet_id } : null
  databricks_sku             = var.databricks_sku
  tags                       = var.tags
}

resource "databricks_cluster" "single_node" {
  # single node cluster not supported in unity
  count = var.metastore_id == null ? 1 : 0

  cluster_name            = "Single"
  spark_version           = local.spark_version
  node_type_id            = "Standard_DS3_v2"
  autotermination_minutes = var.autotermination_minutes
  is_pinned               = true

  spark_conf = merge(local.spark_conf, {
    "spark.databricks.cluster.profile" : "singleNode"
    "spark.master" : "local[*]"
  })

  custom_tags = {
    "ResourceClass" = "SingleNode",
    "Cluster"       = "Single"
  }
}

resource "databricks_cluster" "small" {
  cluster_name            = "Small"
  spark_version           = local.spark_version
  runtime_engine          = "PHOTON"
  node_type_id            = "Standard_DS3_v2"
  autotermination_minutes = var.autotermination_minutes
  is_pinned               = true

  autoscale {
    min_workers = 1
    max_workers = 5
  }

  # dynamic "init_scripts" {
  #   for_each = var.init_script_volumes
  #   iterator = init_script
  #   content {
  #     volumes {
  #       destination = init_script.value
  #     }
  #   }
  # }

  spark_conf = local.spark_conf

  data_security_mode = var.metastore_id != null ? "USER_ISOLATION" : "NONE"

  custom_tags = {
    "Cluster" = "Small"
  }
}

resource "databricks_sql_endpoint" "small" {
  name                      = "SQL endpoint"
  cluster_size              = "2X-Small"
  max_num_clusters          = 1
  auto_stop_mins            = var.autotermination_minutes
  spot_instance_policy      = "COST_OPTIMIZED"
  enable_serverless_compute = false
  warehouse_type            = "PRO"

  tags {
    custom_tags {
      key   = "application"
      value = "dbt_connect"
    }
  }
}

resource "databricks_secret_scope" "variable_scopes" {
  for_each = toset(var.secrets[*].scope)

  name                     = each.key
  initial_manage_principal = "users"
}

resource "databricks_secret" "variable_secrets" {
  for_each = { for s in var.secrets : "${s.scope}.${s.key}" => s }

  key          = each.value.key
  string_value = each.value.value
  scope        = databricks_secret_scope.variable_scopes[each.value.scope].name
}

/* resource "azurerm_role_assignment" "this" {
  for_each = { for id in var.access_for_service_principals : id.client_id => id }

  principal_id         = each.value.principal_id
  scope                = module.databricks.id
  role_definition_name = "Reader"
}

resource "databricks_service_principal" "this" {
  for_each = { for id in var.access_for_service_principals : id.client_id => id }

  application_id        = each.value.client_id
  databricks_sql_access = true
} */

resource "databricks_permissions" "sql_endpoint_usage" {
  sql_endpoint_id = databricks_sql_endpoint.small.id

  access_control {
    group_name       = "users"
    permission_level = "CAN_USE"
  }
}

resource "databricks_permissions" "cluster_usage" {
  cluster_id = databricks_cluster.small.id

  access_control {
    group_name       = "users"
    permission_level = "CAN_ATTACH_TO"
  }
}

resource "databricks_permissions" "token_usage" {
  authorization = "tokens"

  access_control {
    group_name       = "users"
    permission_level = "CAN_USE"
  }
}