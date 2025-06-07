locals {
  managed_resource_group_name = "${var.resource_group_name}-managed"
}

resource "azurerm_databricks_workspace" "databricks" {
  #checkov:skip=CKV_AZURE_158:Ensure that databricks workspace has not public
  name                        = var.databricks_workspace_name
  resource_group_name         = var.resource_group_name
  location                    = var.location
  sku                         = var.databricks_sku
  managed_resource_group_name = local.managed_resource_group_name
  tags                        = var.tags
  custom_parameters {
    virtual_network_id                                   = var.vnet.id
    public_subnet_name                                   = var.vnet.public_subnet.name
    public_subnet_network_security_group_association_id  = var.vnet.public_subnet.nsg_id
    private_subnet_name                                  = var.vnet.private_subnet.name
    private_subnet_network_security_group_association_id = var.vnet.private_subnet.nsg_id
    no_public_ip                                         = var.no_public_ip
  }
}

resource "azurerm_private_endpoint" "backend" {
  count = var.private_endpoint != null ? 1 : 0

  name                = var.private_endpoint.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint.subnet_id

  private_service_connection {
    name                           = var.private_endpoint.name
    private_connection_resource_id = azurerm_databricks_workspace.databricks.id
    is_manual_connection           = false
    subresource_names              = ["databricks_ui_api"]
  }
}

### Logging
locals {
  logging_target_resource = azurerm_databricks_workspace.databricks.id
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

