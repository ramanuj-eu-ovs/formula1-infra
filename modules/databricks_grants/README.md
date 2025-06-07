<!-- BEGIN_TF_DOCS -->
# Automatically generated documentation
Below documentation is generated using the [Terraform docs](https://terraform-docs.io/user-guide/introduction/) tooling.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.2 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | 1.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | 1.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_grants.catalog](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/grants) | resource |
| [databricks_grants.location](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/grants) | resource |
| [databricks_grants.schema](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/grants) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_catalog"></a> [catalog](#input\_catalog) | Name of the catalog to which you want to grant permisions | `string` | n/a | yes |
| <a name="input_grants_config"></a> [grants\_config](#input\_grants\_config) | YAML file containing the grants configuration | `string` | n/a | yes |
| <a name="input_locations"></a> [locations](#input\_locations) | The map of locations to grant permissions to. key = same as config, value = location as in metastore | `map(string)` | n/a | yes |
| <a name="input_schemas"></a> [schemas](#input\_schemas) | The map of schemas to grant permissions to. key = same as config, value = schema as in metastore | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->