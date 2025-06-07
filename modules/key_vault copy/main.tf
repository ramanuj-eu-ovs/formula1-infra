locals {
  private_endpoint = var.private_endpoint != null
  turn_on_firewall = local.private_endpoint || length(var.vnet_rules) > 0
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  #checkov:skip=CKV_AZURE_42:Ensure the key vault is recoverable
  #checkov:skip=CKV_AZURE_110:Ensure that key vault enables purge protection
  #checkov:skip=CKV_AZURE_189:Ensure that Azure Key Vault disables public network access
  name                          = var.key_vault_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  enabled_for_disk_encryption   = true
  tenant_id                     = var.tenant_id
  purge_protection_enabled      = var.purge_protection_enabled
  sku_name                      = "standard"
  tags                          = var.tags
  enable_rbac_authorization     = true
  public_network_access_enabled = true

  network_acls {
    default_action             = local.turn_on_firewall ? "Deny" : "Allow" # Workaround such that we can ignore ip_rules.
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = var.vnet_rules[*].id
  }

  lifecycle {
    ignore_changes = [network_acls[0].ip_rules]
  }
}

resource "azurerm_private_endpoint" "this" {
  count = local.private_endpoint ? 1 : 0

  name                = var.private_endpoint.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint.subnet_id

  private_service_connection {
    name                           = var.private_endpoint.name
    private_connection_resource_id = azurerm_key_vault.key_vault.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "role_assignment_reader" {
  for_each = var.aad_reader_ids

  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "role_assignment_contributor" {
  for_each = var.aad_admin_ids

  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = each.value
}

resource "azurerm_role_assignment" "role_assignment_cicd_sp" {
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

# Needed as the role_assignment for the sp isn't inmediately available
# A small sleep "fixes" this.
resource "time_sleep" "wait_10_seconds" {
  depends_on      = [azurerm_role_assignment.role_assignment_cicd_sp]
  create_duration = "10s"
}

### Logging
locals {
  logging_target_resource = azurerm_key_vault.key_vault.id
}

data "azurerm_monitor_diagnostic_categories" "this" {
  resource_id = local.logging_target_resource
}

resource "azurerm_monitor_diagnostic_setting" "this" {
  count = var.log_analytics_workspace_id != null ? 1 : 0

  name                       = "diagnostic_setting"
  target_resource_id         = local.logging_target_resource
  log_analytics_workspace_id = var.log_analytics_workspace_id

  dynamic "enabled_log" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.this.log_category_types)

    content {
      category = log.value
    }
  }

  dynamic "metric" {
    for_each = toset(data.azurerm_monitor_diagnostic_categories.this.metrics)

    content {
      category = metric.value
    }
  }
}
