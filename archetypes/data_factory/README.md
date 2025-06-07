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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_data_factory"></a> [data\_factory](#module\_data\_factory) | ../../modules/data_factory | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_naming"></a> [naming](#module\_naming) | ../../modules/naming | n/a |
| <a name="module_sql_server"></a> [sql\_server](#module\_sql\_server) | ../../modules/sql | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage_account | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_action_group.adf_alert_group](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/monitor_action_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alerting_enabled"></a> [alerting\_enabled](#input\_alerting\_enabled) | Should the alerting for ADF be enabled or not. | `bool` | n/a | yes |
| <a name="input_data_factory_global_parameters"></a> [data\_factory\_global\_parameters](#input\_data\_factory\_global\_parameters) | The global parameters of the data factory. | <pre>list(object({<br>    name  = string,<br>    type  = string,<br>    value = string,<br>  }))</pre> | `[]` | no |
| <a name="input_data_factory_vsts_configuration"></a> [data\_factory\_vsts\_configuration](#input\_data\_factory\_vsts\_configuration) | Configuration to link Data factory with git. | <pre>object({<br>    account_name    = string,<br>    branch_name     = string,<br>    project_name    = string,<br>    repository_name = string,<br>    root_folder     = string<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region to be used. | `string` | `"westeurope"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log Analytics Workspace ID for sending metrics and logs of Landing resources. | `string` | `null` | no |
| <a name="input_monitoring_alert_email_addresses"></a> [monitoring\_alert\_email\_addresses](#input\_monitoring\_alert\_email\_addresses) | List of email addresses to send alerts to (when alerting\_enabled=true). | `list(string)` | `[]` | no |
| <a name="input_naming"></a> [naming](#input\_naming) | n/a | <pre>object({<br>    prefix = list(string)<br>    suffix = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_private_endpoint"></a> [private\_endpoint](#input\_private\_endpoint) | n/a | <pre>object({<br>    subnet_id = string,<br>    enabled   = optional(bool, true)<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Resource Group where Landing components will be deployed. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json). | `map(string)` | n/a | yes |
| <a name="input_vnet_rules"></a> [vnet\_rules](#input\_vnet\_rules) | n/a | <pre>list(object({<br>    name = string,<br>    id   = string,<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_factory_id"></a> [data\_factory\_id](#output\_data\_factory\_id) | n/a |
| <a name="output_data_factory_principal_id"></a> [data\_factory\_principal\_id](#output\_data\_factory\_principal\_id) | n/a |
| <a name="output_data_factory_shir_authorization_key"></a> [data\_factory\_shir\_authorization\_key](#output\_data\_factory\_shir\_authorization\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
<!-- END_TF_DOCS -->