module "resource_group" {
  source = "./modules/resource_group"
  #resource_group_name = module.naming.naming_container_registry.resource_group_name
  resource_group_name = "rg-DAP-ops" #until the resource_group naming is fixed
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

/* module "github_runner" {
  count                      = var.runner_registration_token != "" ? 1 : 0
  source                     = "./archetypes/linux_vm_github_runner"
  resource_group_name        = module.resource_group.resource_group_name
  subnet_id                  = module.vnet.subnets["subnet-runner"].id
  naming                     = module.naming_github_runner.settings
  log_analytics_workspace_id = var.log_analytics_workspace_id
  vnet_rules = [
    { name = "github-runner-subnet",
    id = module.vnet.subnets["subnet-runner"].id },
    { name : "github-action-runner-vnet", # TODO: Old runner need to be removed 
      id : "/subscriptions/2104e93b-4560-42ec-8c1b-8f18eda53627/resourceGroups/D1HPRGEW001/providers/Microsoft.Network/virtualNetworks/D1HP-vm-DAP-githubactionrunner-dev-vnet/subnets/default"
    }
  ]
  aad_reader_ids = {
    kdap_technical_owners = var.ops_technical_owners
  }
  tags                      = var.tags
  runner_registration_token = var.runner_registration_token
} */
