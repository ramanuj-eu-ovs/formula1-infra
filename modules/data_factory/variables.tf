variable "data_factory_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "vsts_configuration" {
  description = "Configuration to link Data factory with git."
  type = object({
    account_name    = string,
    branch_name     = string,
    project_name    = string,
    repository_name = string,
    root_folder     = string,
  })
  default = null
}

variable "tenant_id" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "monitor_action_group_id" {
  type        = string
  description = "Optional, Action group to be used to log alerts"
  default     = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "global_parameters" {
  description = "The global parameters."
  type = list(object({
    name  = string,
    type  = string,
    value = string,
  }))
  default = null
}

variable "private_endpoint" {
  type = object({
    name      = string,
    subnet_id = string
  })
  default = null
}

variable "alerting_enabled" {
  description = "Should the alerting for ADF be enabled or not."
  type        = bool
}