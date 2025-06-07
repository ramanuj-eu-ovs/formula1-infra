module "naming" {
  source = "../../modules/naming"
  prefix = var.naming.prefix
  suffix = var.naming.suffix
}

module "vm" {
  source              = "../../modules/windows_vm"
  vm_name             = module.naming.linux_virtual_machine.name
  computer_name       = module.naming.windows_virtual_machine.name
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = var.subnet_id
  key_vault_id        = var.key_vault_id
  nic_name            = module.naming.network_interface.name
  tags                = var.tags
}

module "storage_account" {
  source                     = "../../modules/storage_account"
  storage_account_name       = module.naming.storage_account.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  is_hns_enabled             = false
  log_analytics_workspace_id = var.log_analytics_workspace_id
  tags                       = var.tags
  blob_file_systems          = ["vm-scripts"]
}

resource "azurerm_storage_blob" "this" {
  name                   = "install-script.ps1"
  storage_account_name   = module.storage_account.storage_account_name
  storage_container_name = "vm-scripts"
  type                   = "Block"
  source                 = "${path.module}/files/install-script.ps1"
  content_md5            = filemd5("${path.module}/files/install-script.ps1")
}

resource "azurerm_virtual_machine_extension" "this" {
  name                 = "self-hosted-adf-integration-runtime-installation"
  virtual_machine_id   = module.vm.virtual_machine_id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"

  settings           = <<SETTINGS
    {
        "fileUris": ["${azurerm_storage_blob.this.url}"]
    }
  SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted -File install-script.ps1 ${var.data_factory_shir_authorization_key}",
      "storageAccountName": "${module.storage_account.storage_account_name}",
      "storageAccountKey": "${module.storage_account.storage_account_primary_access_key}"
    }
  PROTECTED_SETTINGS
}
