variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group where Landing components will be deployed."
}

variable "naming" {
  type = object({
    prefix = list(string)
    suffix = list(string)
  })
}

variable "location" {
  type        = string
  description = "Azure Region to be used."
  default     = "westeurope"
}

variable "subnet_id" {
  type = string
}

variable "key_vault_id" {
  type = string
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics Workspace ID for sending metrics and logs of Landing resources."
  default     = null
}

variable "data_factory_shir_authorization_key" {
  type      = string
  sensitive = true
}

variable "tags" {
  type        = map(string)
  description = "Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json)."
}
