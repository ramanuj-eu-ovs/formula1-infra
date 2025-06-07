variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where data science workspace components will be deployed."
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

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log analytics workspace id for sending metrics and logs of data science workspace resources."
}

variable "tags" {
  type        = map(string)
  description = "Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json)."
}

variable "container_registry_sku" {
  type        = string
  description = "Container registry sku for the machine learning workspace"
  default     = "Basic"
}

variable "storage_account_mounts" {
  type = map(object({ name = string, container = string, resource_group_name = string }))
}

variable "databricks_sp" {
  type = object({
    id        = string
    secret    = string
    object_id = string
  })
  sensitive = true
  default   = null
}

variable "vnet_rules" {
  description = "The virtual network rules to whitelist."
  type = list(object({
    name = string,
    id   = string,
  }))
  default = []
}