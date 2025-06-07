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
| [azurerm_management_lock.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/management_lock) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_private_endpoint.blob](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/private_endpoint) | resource |
| [azurerm_private_endpoint.dfs](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/private_endpoint) | resource |
| [azurerm_role_assignment.role_assignment_storage](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.storage_account](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.file_systems](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/storage_container) | resource |
| [azurerm_storage_data_lake_gen2_filesystem.file_systems](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/storage_data_lake_gen2_filesystem) | resource |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_kind"></a> [account\_kind](#input\_account\_kind) | n/a | `string` | `"StorageV2"` | no |
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | n/a | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | n/a | `string` | `"Standard"` | no |
| <a name="input_adls_file_systems"></a> [adls\_file\_systems](#input\_adls\_file\_systems) | List of adls gen2 file systems. | `list(string)` | `[]` | no |
| <a name="input_blob_file_systems"></a> [blob\_file\_systems](#input\_blob\_file\_systems) | List of blob file systems. | `list(string)` | `[]` | no |
| <a name="input_enable_static_website"></a> [enable\_static\_website](#input\_enable\_static\_website) | n/a | `bool` | `false` | no |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | n/a | `string` | `"index.html"` | no |
| <a name="input_is_hns_enabled"></a> [is\_hns\_enabled](#input\_is\_hns\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_private_endpoint"></a> [private\_endpoint](#input\_private\_endpoint) | n/a | <pre>object({<br>    name      = string,<br>    subnet_id = string<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_storage_contributors"></a> [storage\_contributors](#input\_storage\_contributors) | n/a | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vnet_rules"></a> [vnet\_rules](#input\_vnet\_rules) | The virtual network rules to whitelist. | <pre>list(object({<br>    name = string,<br>    id   = string,<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_adls_file_systems"></a> [adls\_file\_systems](#output\_adls\_file\_systems) | n/a |
| <a name="output_blob_file_systems"></a> [blob\_file\_systems](#output\_blob\_file\_systems) | n/a |
| <a name="output_storage_account_blob_endpoint"></a> [storage\_account\_blob\_endpoint](#output\_storage\_account\_blob\_endpoint) | n/a |
| <a name="output_storage_account_dfs_endpoint"></a> [storage\_account\_dfs\_endpoint](#output\_storage\_account\_dfs\_endpoint) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_access_key"></a> [storage\_account\_primary\_access\_key](#output\_storage\_account\_primary\_access\_key) | n/a |
| <a name="output_storage_account_primary_connection_string"></a> [storage\_account\_primary\_connection\_string](#output\_storage\_account\_primary\_connection\_string) | n/a |
| <a name="output_storage_account_secondary_access_key"></a> [storage\_account\_secondary\_access\_key](#output\_storage\_account\_secondary\_access\_key) | n/a |
<!-- END_TF_DOCS -->