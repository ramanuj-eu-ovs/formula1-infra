locals {
  global_parameters_default = var.global_parameters == null ? [] : var.global_parameters
  global_parameters = {
    for global_parameter in local.global_parameters_default :
    global_parameter.name => global_parameter
  }
}

resource "azurerm_data_factory" "data_factory_vsts" {
  #checkov:skip=CKV2_AZURE_15:Ensure that Azure data factories are encrypted with a customer-managed key
  #checkov:skip=CKV_AZURE_104:Ensure that Azure Data factory public network access is disabled
  name                            = var.data_factory_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  managed_virtual_network_enabled = true

  identity {
    type = "SystemAssigned"
  }

  dynamic "vsts_configuration" {
    for_each = var.vsts_configuration == null ? [] : tolist([var.vsts_configuration])

    content {
      account_name    = vsts_configuration.value["account_name"]
      branch_name     = vsts_configuration.value["branch_name"]
      project_name    = vsts_configuration.value["project_name"]
      repository_name = vsts_configuration.value["repository_name"]
      root_folder     = vsts_configuration.value["root_folder"]
      tenant_id       = var.tenant_id
    }

  }

  dynamic "global_parameter" {
    for_each = local.global_parameters

    content {
      name  = global_parameter.value.name
      type  = global_parameter.value.type
      value = global_parameter.value.value
    }
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to github configuration since this is done by
      # Kubota IT and outside of the scope of terraform see:
      # https://kubota-jira.atlassian.net/browse/DAPKE-81
      github_configuration
    ]
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "failed_pipeline_runs" {
  count = var.alerting_enabled ? 1 : 0

  name                = "${var.data_factory_name}-pipeline-runs-alert"
  resource_group_name = var.resource_group_name
  scopes              = [azurerm_data_factory.data_factory_vsts.id]
  description         = "Action will be triggered when any pipeline fails."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "PipelineFailedRuns"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }
  action {
    action_group_id = var.monitor_action_group_id
  }

  tags = var.tags
}

resource "azurerm_monitor_metric_alert" "elapsed_pipeline_runs" {
  count = var.alerting_enabled ? 1 : 0

  name                = "${var.data_factory_name}-elapsed-pipeline-runs-alert"
  resource_group_name = var.resource_group_name
  scopes              = [azurerm_data_factory.data_factory_vsts.id]
  description         = "Action will be triggered when any pipeline exceeds their specified SLA (elapsed time)."

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "PipelineElapsedTimeRuns"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }
  action {
    action_group_id = var.monitor_action_group_id
  }

  tags = var.tags
}

resource "azurerm_data_factory_integration_runtime_self_hosted" "this" {
  name            = "self-hosted-runtime"
  data_factory_id = azurerm_data_factory.data_factory_vsts.id
}

resource "azurerm_private_endpoint" "this" {
  count = var.private_endpoint != null ? 1 : 0

  name                = var.private_endpoint.name
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.private_endpoint.subnet_id

  private_service_connection {
    name                           = var.private_endpoint.name
    private_connection_resource_id = azurerm_data_factory.data_factory_vsts.id
    is_manual_connection           = false
    subresource_names              = ["datafactory"]
  }

  tags = var.tags
}

### Logging
locals {
  logging_target_resource = azurerm_data_factory.data_factory_vsts.id
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
