<!-- BEGIN_TF_DOCS -->
# Automatically generated documentation
Below documentation is generated using the [Terraform docs](https://terraform-docs.io/user-guide/introduction/) tooling.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.85.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.85.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_naming"></a> [naming](#module\_naming) | ../../modules/naming | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage_account | n/a |
| <a name="module_vm"></a> [vm](#module\_vm) | ../../modules/windows_vm | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_blob.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/storage_blob) | resource |
| [azurerm_virtual_machine_extension.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/virtual_machine_extension) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_factory_shir_authorization_key"></a> [data\_factory\_shir\_authorization\_key](#input\_data\_factory\_shir\_authorization\_key) | n/a | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure Region to be used. | `string` | `"westeurope"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log Analytics Workspace ID for sending metrics and logs of Landing resources. | `string` | `null` | no |
| <a name="input_naming"></a> [naming](#input\_naming) | n/a | <pre>object({<br>    prefix = list(string)<br>    suffix = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Resource Group where Landing components will be deployed. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json). | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->