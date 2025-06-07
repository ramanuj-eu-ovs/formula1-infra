<!-- BEGIN_TF_DOCS -->
# Automatically generated documentation
Below documentation is generated using the [Terraform docs](https://terraform-docs.io/user-guide/introduction/) tooling.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.85.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.85.0 |
| <a name="provider_time"></a> [time](#provider\_time) | 0.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/key_vault) | resource |
| [azurerm_monitor_diagnostic_setting.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/private_endpoint) | resource |
| [azurerm_role_assignment.role_assignment_cicd_sp](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.role_assignment_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.role_assignment_reader](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/role_assignment) | resource |
| [time_sleep.wait_10_seconds](https://registry.terraform.io/providers/hashicorp/time/0.10.0/docs/resources/sleep) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/data-sources/client_config) | data source |
| [azurerm_monitor_diagnostic_categories.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/data-sources/monitor_diagnostic_categories) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_admin_ids"></a> [aad\_admin\_ids](#input\_aad\_admin\_ids) | n/a | `map(string)` | `{}` | no |
| <a name="input_aad_reader_ids"></a> [aad\_reader\_ids](#input\_aad\_reader\_ids) | n/a | `map(string)` | `{}` | no |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `string` | n/a | yes |
| <a name="input_private_endpoint"></a> [private\_endpoint](#input\_private\_endpoint) | n/a | <pre>object({<br>    name      = string,<br>    subnet_id = string<br>  })</pre> | `null` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_vnet_rules"></a> [vnet\_rules](#input\_vnet\_rules) | n/a | <pre>list(object({<br>    name = string,<br>    id   = string,<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | n/a |
<!-- END_TF_DOCS -->