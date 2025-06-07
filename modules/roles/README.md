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
| [azurerm_role_assignment.role-assignment](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_module_name"></a> [module\_name](#input\_module\_name) | Name of the module to which you want to assign roles | `string` | n/a | yes |
| <a name="input_roles_config"></a> [roles\_config](#input\_roles\_config) | YAML file containing the roles configuration | `string` | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope of the resource to which you want to assign roles. If this is a resource group, then this is a resource group ID. If this is a subscription, then this is a subscription ID. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->