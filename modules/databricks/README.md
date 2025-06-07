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
| [azurerm_databricks_workspace.databricks](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/databricks_workspace) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_private_endpoint.backend](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/private_endpoint) | resource |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databricks_sku"></a> [databricks\_sku](#input\_databricks\_sku) | n/a | `string` | `"premium"` | no |
| <a name="input_databricks_workspace_name"></a> [databricks\_workspace\_name](#input\_databricks\_workspace\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_no_public_ip"></a> [no\_public\_ip](#input\_no\_public\_ip) | n/a | `bool` | `false` | no |
| <a name="input_private_endpoint"></a> [private\_endpoint](#input\_private\_endpoint) | n/a | <pre>object({<br>    name      = string,<br>    subnet_id = string<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vnet"></a> [vnet](#input\_vnet) | The vnet to use for the databricks. | <pre>object({<br>    id             = string<br>    public_subnet  = object({ id = string, name = string, nsg_id = string }),<br>    private_subnet = object({ id = string, name = string, nsg_id = string })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | n/a |
| <a name="output_workspace_name"></a> [workspace\_name](#output\_workspace\_name) | n/a |
| <a name="output_workspace_url"></a> [workspace\_url](#output\_workspace\_url) | n/a |
<!-- END_TF_DOCS -->