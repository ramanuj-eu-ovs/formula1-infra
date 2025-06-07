# Data science workspace

The main component in the data science workspace is Azure machine learning
workspace. This is the environment in which the data science is done. The
environment has storage and compute separate from the data lake. However,
the input data is read from the data marts (delta tables).

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
| <a name="module_application_insights"></a> [application\_insights](#module\_application\_insights) | ../../modules/application_insights | n/a |
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | ../../modules/container_registry | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_machine_learning_workspace"></a> [machine\_learning\_workspace](#module\_machine\_learning\_workspace) | ../../modules/machine_learning_workspace | n/a |
| <a name="module_naming"></a> [naming](#module\_naming) | ../../modules/naming | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage_account | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_user_assigned_identity.managed_identity](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/user_assigned_identity) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_registry_sku"></a> [container\_registry\_sku](#input\_container\_registry\_sku) | Container registry sku for the machine learning workspace | `string` | `"Basic"` | no |
| <a name="input_databricks_sp"></a> [databricks\_sp](#input\_databricks\_sp) | n/a | <pre>object({<br>    id        = string<br>    secret    = string<br>    object_id = string<br>  })</pre> | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure Region to be used. | `string` | `"westeurope"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log analytics workspace id for sending metrics and logs of data science workspace resources. | `string` | n/a | yes |
| <a name="input_naming"></a> [naming](#input\_naming) | n/a | <pre>object({<br>    prefix = list(string)<br>    suffix = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group where data science workspace components will be deployed. | `string` | n/a | yes |
| <a name="input_storage_account_mounts"></a> [storage\_account\_mounts](#input\_storage\_account\_mounts) | n/a | `map(object({ name = string, container = string, resource_group_name = string }))` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json). | `map(string)` | n/a | yes |
| <a name="input_vnet_rules"></a> [vnet\_rules](#input\_vnet\_rules) | The virtual network rules to whitelist. | <pre>list(object({<br>    name = string,<br>    id   = string,<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_insights_id"></a> [application\_insights\_id](#output\_application\_insights\_id) | Application insights id of the data science workspace. |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | Key vault id of the data science workspace. |
| <a name="output_machine_learning_workspace_id"></a> [machine\_learning\_workspace\_id](#output\_machine\_learning\_workspace\_id) | Machine learning workspace id of the data science workspace. |
| <a name="output_managed_identity"></a> [managed\_identity](#output\_managed\_identity) | User assigned identity belonging to the data science workspace. |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | Storage account id of the data science workspace. |
<!-- END_TF_DOCS -->
