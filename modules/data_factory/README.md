<!-- BEGIN_TF_DOCS -->
# Automatically generated documentation
Below documentation is generated using the [Terraform docs](https://terraform-docs.io/user-guide/introduction/) tooling.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.85.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.85.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_data_factory.data_factory_vsts](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/data_factory) | resource |
| [azurerm_data_factory_integration_runtime_self_hosted.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/data_factory_integration_runtime_self_hosted) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_metric_alert.elapsed_pipeline_runs](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_monitor_metric_alert.failed_pipeline_runs](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/monitor_metric_alert) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/private_endpoint) | resource |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alerting_enabled"></a> [alerting\_enabled](#input\_alerting\_enabled) | Should the alerting for ADF be enabled or not. | `bool` | n/a | yes |
| <a name="input_data_factory_name"></a> [data\_factory\_name](#input\_data\_factory\_name) | n/a | `string` | n/a | yes |
| <a name="input_global_parameters"></a> [global\_parameters](#input\_global\_parameters) | The global parameters. | <pre>list(object({<br>    name  = string,<br>    type  = string,<br>    value = string,<br>  }))</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_monitor_action_group_id"></a> [monitor\_action\_group\_id](#input\_monitor\_action\_group\_id) | Optional, Action group to be used to log alerts | `string` | `null` | no |
| <a name="input_private_endpoint"></a> [private\_endpoint](#input\_private\_endpoint) | n/a | <pre>object({<br>    name      = string,<br>    subnet_id = string<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_vsts_configuration"></a> [vsts\_configuration](#input\_vsts\_configuration) | Configuration to link Data factory with git. | <pre>object({<br>    account_name    = string,<br>    branch_name     = string,<br>    project_name    = string,<br>    repository_name = string,<br>    root_folder     = string,<br>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_id"></a> [data\_factory\_id](#output\_data\_factory\_id) | n/a |
| <a name="output_data_factory_principal_id"></a> [data\_factory\_principal\_id](#output\_data\_factory\_principal\_id) | n/a |
| <a name="output_data_factory_shir_authorization_key"></a> [data\_factory\_shir\_authorization\_key](#output\_data\_factory\_shir\_authorization\_key) | n/a |
| <a name="output_name"></a> [name](#output\_name) | The data factory name |
<!-- END_TF_DOCS -->