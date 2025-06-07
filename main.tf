module "resource_group" {
  source = "./modules/resource_group"
  #resource_group_name = module.naming.naming_container_registry.resource_group_name
  resource_group_name = "rg-formula1-tst" #until the resource_group naming is fixed
  location            = var.location
  tags                = var.tags
}

module "container_registry" {
  #checkov:skip=CKV_AZURE_137:Ensure ACR admin account is disabled
  source                     = "./modules/container_registry"
  container_registry_name    = module.naming_container_registry.container_registry.name
  resource_group_name        = module.resource_group.resource_group_name
  location                   = var.location
  admin_enabled              = true // Required by ML workspace
  tags                       = var.tags
  log_analytics_workspace_id = var.log_analytics_workspace_id
}

module "vnet" {
  source              = "./modules/vnet"
  location            = var.location
  tags                = var.tags
  resource_group_name = module.resource_group.resource_group_name
  vnet_name           = module.naming_vnet.virtual_network.name
  vnet_range          = "10.0.0.0/16"

  nsg_name = module.naming_vnet.network_security_group.name

  subnets = {
    "subnet-runner" = { prefixes = ["10.0.1.0/24"], service_endpoints = ["Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage"] }
  }
}

