data "azurerm_client_config" "current" {}

locals {
  tenant_id = data.azurerm_client_config.current.tenant_id
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
  tags                       = var.tags
  log_analytics_workspace_id = var.log_analytics_workspace_id
  vnet_rules                 = var.vnet_rules
}

module "key_vault" {
  source                     = "../../modules/key_vault"
  key_vault_name             = module.naming.key_vault.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tenant_id                  = local.tenant_id
  purge_protection_enabled   = true // Machine learning workspace sets this to True
  tags                       = var.tags
  vnet_rules                 = var.vnet_rules
}

module "application_insights" {
  source                    = "../../modules/application_insights"
  application_insights_name = module.naming.application_insights.name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  application_type          = "web"
  tags                      = var.tags
}

module "container_registry" {
  #checkov:skip=CKV_AZURE_137:Ensure ACR admin account is disabled
  source                     = "../../modules/container_registry"
  container_registry_name    = module.naming.container_registry.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  admin_enabled              = true // Required by ML workspace
  sku                        = var.container_registry_sku
  tags                       = var.tags
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

resource "azurerm_user_assigned_identity" "managed_identity" {
  name                = module.naming.user_assigned_identity.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "machine_learning_workspace" {
  source                          = "../../modules/machine_learning_workspace"
  machine_learning_workspace_name = module.naming.machine_learning_workspace.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  application_insights_id         = module.application_insights.application_insights_id
  key_vault_id                    = module.key_vault.key_vault_id
  storage_account_id              = module.storage_account.storage_account_id
  container_registry_id           = module.container_registry.id
  storage_account_mounts          = var.storage_account_mounts
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  tags                            = var.tags
  databricks_sp                   = var.databricks_sp
  tenant_id                       = local.tenant_id
}
