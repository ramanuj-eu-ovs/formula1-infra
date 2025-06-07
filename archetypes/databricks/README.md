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
| <a name="module_databricks"></a> [databricks](#module\_databricks) | ../../modules/databricks | n/a |
| <a name="module_naming"></a> [naming](#module\_naming) | ../../modules/naming | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/role_assignment) | resource |
| [databricks_cluster.single_node](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/cluster) | resource |
| [databricks_cluster.small](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/cluster) | resource |
| [databricks_permissions.cluster_usage](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/permissions) | resource |
| [databricks_permissions.sql_endpoint_usage](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/permissions) | resource |
| [databricks_permissions.token_usage](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/permissions) | resource |
| [databricks_secret.variable_secrets](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/secret) | resource |
| [databricks_secret_scope.variable_scopes](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/secret_scope) | resource |
| [databricks_service_principal.this](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/service_principal) | resource |
| [databricks_sql_endpoint.small](https://registry.terraform.io/providers/databricks/databricks/1.33.0/docs/resources/sql_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_for_service_principals"></a> [access\_for\_service\_principals](#input\_access\_for\_service\_principals) | ID's of service principals who get access to this workspace | `set(object({ id = string, client_id = string, principal_id = string, tenant_id = string }))` | n/a | yes |
| <a name="input_autotermination_minutes"></a> [autotermination\_minutes](#input\_autotermination\_minutes) | Auto termination time for the compute (clusters and SQL endpoints) in minutes. | `number` | `10` | no |
| <a name="input_databricks_sku"></a> [databricks\_sku](#input\_databricks\_sku) | n/a | `string` | `"premium"` | no |
| <a name="input_init_script_volumes"></a> [init\_script\_volumes](#input\_init\_script\_volumes) | Path to init-scripts on volumes to attach to the clusters with unity | `set(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure Region to be used. | `string` | `"westeurope"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | Log Analytics Workspace ID for sending metrics and logs of Landing resources. | `string` | `null` | no |
| <a name="input_metastore_id"></a> [metastore\_id](#input\_metastore\_id) | n/a | `string` | `null` | no |
| <a name="input_naming"></a> [naming](#input\_naming) | n/a | <pre>object({<br>    prefix = list(string)<br>    suffix = list(string)<br>  })</pre> | n/a | yes |
| <a name="input_private_endpoint"></a> [private\_endpoint](#input\_private\_endpoint) | Subnet ID where to deploy the private endpoint into. | <pre>object({<br>    subnet_id = string,<br>    enabled   = optional(bool, true)<br>  })</pre> | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the Resource Group where Landing components will be deployed. | `string` | n/a | yes |
| <a name="input_secrets"></a> [secrets](#input\_secrets) | Secrets to add. | `list(object({ scope = string, key = string, value = string }))` | `[]` | no |
| <a name="input_spark_conf"></a> [spark\_conf](#input\_spark\_conf) | Spark configuration to be added to a cluster. | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json). | `map(string)` | n/a | yes |
| <a name="input_vnet"></a> [vnet](#input\_vnet) | The vnet to use for the databricks. | <pre>object({<br>    id             = string<br>    public_subnet  = object({ id = string, name = string, nsg_id = string }),<br>    private_subnet = object({ id = string, name = string, nsg_id = string })<br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_cluster_id"></a> [default\_cluster\_id](#output\_default\_cluster\_id) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | n/a |
| <a name="output_workspace_url"></a> [workspace\_url](#output\_workspace\_url) | n/a |
<!-- END_TF_DOCS -->