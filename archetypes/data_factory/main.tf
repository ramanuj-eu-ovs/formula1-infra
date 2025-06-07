data "azurerm_client_config" "current" {}

locals {
  tenant_id = data.azurerm_client_config.current.tenant_id

  data_factory_global_parameters = concat(
    var.data_factory_global_parameters, [
      { name = "key_vault_uri", type = "String", value = module.key_vault.key_vault_uri },
      { name = "storage_account_uri", type = "String", value = module.storage_account.storage_account_blob_endpoint },
      { name = "sqldb_fqdn", type = "String", value = module.sql_server.fqdn },
      { name = "sqldb_database_name", type = "String", value = "watermarks" },
    ]
  )

  deploy_pe = try(var.private_endpoint.enabled, false)
}

module "naming" {
  source = "../../modules/naming"
  prefix = var.naming.prefix
  suffix = var.naming.suffix
}

module "storage_account" {
  source                     = "../../modules/storage_account"
  storage_account_name       = module.naming.storage_account.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  is_hns_enabled             = false
  storage_contributors       = { adf = module.data_factory.data_factory_principal_id }
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags                       = var.tags
  blob_file_systems          = ["raw", "nirsensorraw"]
  ## DAPKE-85: disable vnet restrictions on storage account
  # vnet_rules       = var.vnet_rules
  private_endpoint = local.deploy_pe ? { name = module.naming.private_endpoint.name, subnet_id = var.private_endpoint.subnet_id } : null
  ##
}

resource "azurerm_monitor_action_group" "adf_alert_group" {
  count               = var.alerting_enabled ? 1 : 0
  name                = "adf-alerts"
  resource_group_name = var.resource_group_name
  short_name          = "adf-alerts"

  dynamic "email_receiver" {
    for_each = var.monitoring_alert_email_addresses
    iterator = email
    content {
      name          = email.value
      email_address = email.value
    }
  }

  tags = var.tags
}

module "data_factory" {
  source                     = "../../modules/data_factory"
  data_factory_name          = module.naming.data_factory.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  vsts_configuration         = var.data_factory_vsts_configuration
  tenant_id                  = local.tenant_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  alerting_enabled           = var.alerting_enabled
  monitor_action_group_id    = var.alerting_enabled ? azurerm_monitor_action_group.adf_alert_group[0].id : null
  global_parameters          = local.data_factory_global_parameters
  tags                       = var.tags
  private_endpoint           = local.deploy_pe ? { name = "${module.naming.private_endpoint.name}-adf", subnet_id = var.private_endpoint.subnet_id } : null
}

module "key_vault" {
  source                     = "../../modules/key_vault"
  key_vault_name             = module.naming.key_vault.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tenant_id                  = local.tenant_id
  aad_reader_ids             = { adf = module.data_factory.data_factory_principal_id }
  tags                       = var.tags
  private_endpoint           = local.deploy_pe ? { name = "${module.naming.private_endpoint.name}-kv", subnet_id = var.private_endpoint.subnet_id } : null
  vnet_rules                 = var.vnet_rules
}

module "sql_server" {
  source                     = "../../modules/sql"
  sql_server_name            = module.naming.sql_server.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  key_vault_id               = module.key_vault.key_vault_id

  application_databases = [{
    "name" : "watermarks",
    "sku_name" : "Basic",
    "max_size_gb" : "2",
    "additional_aad_admins" : { adf = module.data_factory.data_factory_principal_id }
  }]

  vnet_rules = var.vnet_rules

  tags             = var.tags
  private_endpoint = local.deploy_pe ? { name = "${module.naming.private_endpoint.name}-sql", subnet_id = var.private_endpoint.subnet_id } : null
}
