<!-- BEGIN_TF_DOCS -->
# Automatically generated documentation
Below documentation is generated using the [Terraform docs](https://terraform-docs.io/user-guide/introduction/) tooling.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.85.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 1.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.85.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_storage_blob.init_script](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/storage_blob) | resource |
| [azurerm_storage_blob.write_jars](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/storage_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_databricks_path"></a> [databricks\_path](#input\_databricks\_path) | n/a | `string` | n/a | yes |
| <a name="input_extra_commands_init_script"></a> [extra\_commands\_init\_script](#input\_extra\_commands\_init\_script) | List of extra command to pass in the init script | `list(string)` | `[]` | no |
| <a name="input_jars"></a> [jars](#input\_jars) | Mapping of the jars to download: `{'local_name.jar' = 'http://maven.org/package.jar'`} | `map(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of this extension | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | n/a | yes |
| <a name="input_storage_container_name"></a> [storage\_container\_name](#input\_storage\_container\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_databricks_init_script_path"></a> [databricks\_init\_script\_path](#output\_databricks\_init\_script\_path) | n/a |
<!-- END_TF_DOCS -->