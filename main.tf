module "resource_group" {
  source = "./modules/resource_group"
  #resource_group_name = module.naming.naming_container_registry.resource_group_name
  resource_group_name = "rg-formula1-tst" #until the resource_group naming is fixed
  location            = var.location
  tags                = var.tags
}

module "resource_group_vnet" {
  source              = "./modules/resource_group"
  resource_group_name = module.naming_vnet.resource_group.name
  location            = var.location
  tags                = var.tags
}

module "vnet" {
  source = "./modules/vnet"

  location            = var.location
  tags                = var.tags
  resource_group_name = module.resource_group_vnet.resource_group_name

  vnet_name  = module.naming_vnet.virtual_network.name
  vnet_range = "10.0.0.0/16"

  nsg_name = module.naming_vnet.network_security_group.name

  subnets = {
    "adb-public"       = { prefixes = ["10.0.1.0/24"], service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"], delegation = { name = "Microsoft.Databricks/workspaces", actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] } },
    "adb-private"      = { prefixes = ["10.0.2.0/24"], service_endpoints = ["Microsoft.Sql", "Microsoft.Storage"], delegation = { name = "Microsoft.Databricks/workspaces", actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"] } },
    "sser"             = { prefixes = ["10.0.3.0/24"], service_endpoints = ["Microsoft.Storage"] },
    "container-groups" = { prefixes = ["10.0.4.0/24"], service_endpoints = ["Microsoft.Storage"], delegation = { name = "Microsoft.ContainerInstance/containerGroups", actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"] } },
  }
}

module "roles_vnet" {
  source       = "./modules/roles"
  roles_config = local.roles_config
  module_name  = "vnet"
  scope        = module.resource_group_vnet.id
}

module "resource_group_ingestion" {
  source              = "./modules/resource_group"
  resource_group_name = module.naming_ingestion.resource_group.name
  location            = var.location
  tags                = var.tags
}

module "data_factory" {
  source = "./archetypes/data_factory"

  naming              = module.naming_ingestion.settings
  location            = var.location
  tags                = var.tags
  resource_group_name = module.resource_group_ingestion.resource_group_name

  data_factory_vsts_configuration  = var.data_factory_vsts_configuration
  vnet_rules                       = var.vnet_rules
  alerting_enabled                 = var.adf_alerting_enabled
  monitoring_alert_email_addresses = var.adf_alerting_email_addresses
  data_factory_global_parameters = [
    {
      name  = "datalake_storage_account_uri",
      type  = "String",
      value = module.datalake.storage_account_dfs_endpoint
    },
    {
      name  = "dbt_container_instance_id",
      type  = "String",
      value = module.container_group_full_refresh_dbt.container_group_id
    }
    /* ,
    {
      name  = "kfs_container_instance_id",
      type  = "String",
      value = module.container_group_full_refresh_kfs.container_group_id
    },
    {
      name  = "kns_container_instance_id",
      type  = "String",
      value = module.container_group_full_refresh_kns.container_group_id
    } */
  ]
}

module "roles_ingestion" {
  source       = "./modules/roles"
  roles_config = local.roles_config
  module_name  = "ingestion"
  scope        = module.resource_group_ingestion.id
}

module "resource_group_datalake" {
  source              = "./modules/resource_group"
  resource_group_name = module.naming_datalake.resource_group.name
  location            = var.location
  tags                = var.tags
}

module "datalake" {
  source                     = "./modules/storage_account"
  storage_account_name       = module.naming_datalake.storage_account.name
  resource_group_name        = module.resource_group_datalake.resource_group_name
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  storage_contributors       = { adf = module.data_factory.data_factory_principal_id }
  tags                       = var.tags
  adls_file_systems          = ["landing", "transformations", local.databricks_utils_volume.container, "landing-predictions"]
  vnet_rules = concat([
    {
      name : "adb-public"
      id : module.vnet.subnets["adb-public"].id
    },
    {
      name : "adb-private"
      id : module.vnet.subnets["adb-private"].id
    },
    {
      name : "sser"
      id : module.vnet.subnets["sser"].id
    },
    {
      name : "container-groups"
      id : module.vnet.subnets["container-groups"].id
    }
  ], var.vnet_rules)
}

module "databricks_datalake" {
  source = "./archetypes/databricks"
  naming              = module.naming_datalake.settings
  location            = var.location
  tags                = var.tags
  resource_group_name = module.resource_group_datalake.resource_group_name

  databricks_sku = "premium"
  vnet = {
    id             = module.vnet.id,
    public_subnet  = module.vnet.subnets["adb-public"],
    private_subnet = module.vnet.subnets["adb-private"],
  }
  # metastore_id = var.metastore_id

  # access_for_service_principals = [module.data_science_workspace.managed_identity]

  # init_script_volumes = toset(module.databricks_sedona[*].databricks_init_script_path)

  spark_conf = local.spark_conf

  autotermination_minutes = local.databricks_compute_autotermination_minutes
}

# module "databricks_unity" {
#   source             = "./archetypes/databricks_unity"
#   count              = var.metastore_id != null ? 1 : 0
#   naming             = module.naming_datalake.settings
#   storage_account_id = module.datalake.storage_account_id

#   catalog = {
#     name      = local.databricks_unity_catalog_name
#     container = "transformations"
#     schemas   = toset(["farmcentre_source", "farmcentre_predictions", "farmcentre_staging", "farmcentre_intermediate", "farmcentre_marts", "nirsensor_source", "nirsensor_predictions", "nirsensor_staging", "nirsensor_intermediate", "nirsensor_marts", local.databricks_utils_volume.schema])
#     volumes = toset([
#       local.databricks_utils_volume
#     ])
#   }

#   storage_account = {
#     name           = module.datalake.storage_account_name,
#     resource_group = module.resource_group_datalake.resource_group_name,
#     containers     = toset(keys(module.datalake.adls_file_systems))
#   }

#   databricks_connector = {
#     id           = var.databricks_connector_id
#     principal_id = var.databricks_connector_principal_id
#   }

#   grants_config = local.grants_config

#   depends_on = [module.databricks_datalake.id]
# }

module "roles_datalake" {
  source       = "./modules/roles"
  roles_config = local.roles_config
  module_name  = "datalake"
  scope        = module.resource_group_datalake.id
}

module "resource_group_container_group" {
  source              = "./modules/resource_group"
  resource_group_name = module.naming_resource_group_container_group.resource_group.name
  location            = var.location
  tags                = var.tags
}
data "azurerm_key_vault_secret" "git_repo_url" {
  name         = "dbt-git-repo-url"
  key_vault_id = module.data_factory.key_vault_id
}

data "azurerm_key_vault_secret" "databricks_oauth_client_id" {
  name         = "databricks-oauth-client-id"
  key_vault_id = module.data_factory.key_vault_id
}

data "azurerm_key_vault_secret" "databricks_oauth_client_secret" {
  name         = "databricks-oauth-client-secret"
  key_vault_id = module.data_factory.key_vault_id
}


