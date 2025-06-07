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

variable "log_analytics_workspace_id" {
  type        = string
  description = "Log Analytics Workspace ID for sending metrics and logs of Landing resources."
  default     = null
}

variable "private_endpoint" {
  type = object({
    subnet_id = string,
    enabled   = optional(bool, true)
  })
  default = null
}

variable "vnet_rules" {
  type = list(object({
    name = string,
    id   = string,
  }))
  default = []
}

variable "tags" {
  type        = map(string)
  description = "Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json)."
}

variable "data_factory_vsts_configuration" {
  type = object({
    account_name    = string,
    branch_name     = string,
    project_name    = string,
    repository_name = string,
    root_folder     = string
  })
  description = "Configuration to link Data factory with git."
  default     = null
}

variable "data_factory_global_parameters" {
  type = list(object({
    name  = string,
    type  = string,
    value = string,
  }))
  description = "The global parameters of the data factory."
  default     = []
}

variable "alerting_enabled" {
  description = "Should the alerting for ADF be enabled or not."
  type        = bool
}

variable "monitoring_alert_email_addresses" {
  description = "List of email addresses to send alerts to (when alerting_enabled=true)."
  type        = list(string)
  default     = []
}