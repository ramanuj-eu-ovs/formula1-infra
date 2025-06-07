locals {
  private_endpoint      = var.private_endpoint != null
  private_blob_endpoint = local.private_endpoint ? length(var.blob_file_systems) > 0 : false
  private_dfs_endpoint  = local.private_endpoint ? length(var.adls_file_systems) > 0 : false

  # turn on the firewall, if a private endpoint is defined or if vnet rules are passed
  turn_on_firewall = local.private_endpoint || length(var.vnet_rules) > 0
}

resource "azurerm_storage_account" "storage_account" {
  #checkov:skip=CKV_AZURE_33:Ensure Storage logging is enabled for Queue service for read, write and delete requests
  #checkov:skip=CKV_AZURE_35:Ensure default network access rule for Storage Accounts is set to deny
  #checkov:skip=CKV_AZURE_59:Ensure that Storage accounts disallow public access
  #checkov:skip=CKV_AZURE_206:Ensure that Storage Accounts use replication
  #checkov:skip=CKV2_AZURE_1:Ensure storage for critical data are encrypted with Customer Managed Key
  #checkov:skip=CKV2_AZURE_38:Ensure soft-delete is enabled on Azure storage account
  #checkov:skip=CKV2_AZURE_40:Ensure storage account is not configured with Shared Key authorization
  #checkov:skip=CKV2_AZURE_41:Ensure storage account is configured with SAS expiration policy
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  min_tls_version          = "TLS1_2"
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  is_hns_enabled           = var.is_hns_enabled
  tags                     = var.tags

  allow_nested_items_to_be_public = false
  public_network_access_enabled   = true

  dynamic "static_website" {
    for_each = var.enable_static_website ? [1] : []
    content {
      index_document = var.index_document
    }
  }

  network_rules {
    default_action             = local.turn_on_firewall ? "Deny" : "Allow" # Workaround such that we can ignore ip_rules.
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = var.vnet_rules[*].id
  }
}

resource "azurerm_management_lock" "storage_account" {
  name       = "storage_account_lock"
  scope      = azurerm_storage_account.storage_account.id
  lock_level = "CanNotDelete"
  notes      = "Prevent accidental delete of storage account"
}

resource "azurerm_role_assignment" "role_assignment_storage" {
  for_each = var.storage_contributors

  scope                = azurerm_storage_account.storage_account.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = each.value
}

resource "azurerm_storage_data_lake_gen2_filesystem" "file_systems" {
  for_each           = toset(var.adls_file_systems)
  name               = each.value
  storage_account_id = azurerm_storage_account.storage_account.id
}

resource "azurerm_storage_container" "file_systems" {
  #checkov:skip=CKV2_AZURE_21:Ensure Storage logging is enabled for Blob service for read requests
  for_each             = toset(var.blob_file_systems)
  name                 = each.value
  storage_account_name = azurerm_storage_account.storage_account.name
}

resource "azurerm_private_endpoint" "blob" {
  count = local.private_blob_endpoint ? 1 : 0

  name                = "${var.private_endpoint.name}-blob"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint.subnet_id

  private_service_connection {
    name                           = "${var.private_endpoint.name}-blob"
    private_connection_resource_id = azurerm_storage_account.storage_account.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  tags = var.tags
}

resource "azurerm_private_endpoint" "dfs" {
  count = local.private_dfs_endpoint ? 1 : 0

  name                = "${var.private_endpoint.name}-dfs"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint.subnet_id

  private_service_connection {
    name                           = "${var.private_endpoint.name}-dfs"
    private_connection_resource_id = azurerm_storage_account.storage_account.id
    is_manual_connection           = false
    subresource_names              = ["dfs"]
  }

  tags = var.tags
}

### Logging
locals {
  logging_target_resource = azurerm_storage_account.storage_account.id
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

