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
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | 1.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_databricks_grants"></a> [databricks\_grants](#module\_databricks\_grants) | ../../modules/databricks_grants | n/a |
| <a name="module_naming"></a> [naming](#module\_naming) | ../../modules/naming | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/role_assignment) | resource |
| [databricks_catalog.this](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/catalog) | resource |
| [databricks_external_location.this](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/external_location) | resource |
| [databricks_schema.this](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/schema) | resource |
| [databricks_storage_credential.this](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/storage_credential) | resource |
| [databricks_volume.this](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog"></a> [catalog](#input\_catalog) | n/a | <pre>object({<br>    name      = string,<br>    container = string,<br>    schemas   = set(string),<br>    volumes = set(object({<br>      schema    = string,<br>      name      = string,<br>      container = string<br>    }))<br>  })</pre> | n/a | yes |
| <a name="input_databricks_connector"></a> [databricks\_connector](#input\_databricks\_connector) | n/a | <pre>object({<br>    id           = string,<br>    principal_id = string<br>  })</pre> | n/a | yes |
| <a name="input_grants_config"></a> [grants\_config](#input\_grants\_config) | YAML file containing the grants configuration | `string` | `null` | no |
| <a name="input_naming"></a> [naming](#input\_naming) | n/a | <pre>object({<br>    prefix = list(string)<br>    suffix = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | n/a | <pre>object({<br>    name           = string,<br>    resource_group = string,<br>    containers     = set(string)<br>  })</pre> | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | Storage account tied to unity catalog | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_volume_paths"></a> [volume\_paths](#output\_volume\_paths) | n/a |
<!-- END_TF_DOCS -->