variable "roles_config" {
  type        = string
  description = "YAML file containing the roles configuration"
}

variable "module_name" {
  type        = string
  description = "Name of the module to which you want to assign roles"
}

variable "scope" {
  type        = string
  description = "The scope of the resource to which you want to assign roles. If this is a resource group, then this is a resource group ID. If this is a subscription, then this is a subscription ID."
}
