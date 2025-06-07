variable "project_name" {
  description = "The name of the project/platform."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]*$", var.project_name)) && length(var.project_name) <= 4
    error_message = "The project name value must not contain special characters, and is max 4 characters long."
  }
}

variable "environment" {
  description = "The environment name. Eg, udev/uprd etc."
  type        = string

  validation {
    condition     = length(var.environment) == 4
    error_message = "The environment must be 4 characters."
  }
}

variable "location" {
  type        = string
  description = "Azure Region to be used."
  default     = "westeurope"
}

variable "tags" {
  type        = map(string)
  description = "Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json)."
}

variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "log_analytics_container_groups_id" {
  type    = string
  default = null
}

variable "data_factory_vsts_configuration" {
  type = object({
    account_name    = string,
    branch_name     = string,
    project_name    = string,
    repository_name = string,
    root_folder     = string
  })
  description = "Configuration to link Data Factory with git."
  default     = null
}

variable "metastore_id" {
  type        = string
  description = "The ID of the metastore, can be found in the Databricks Account portal."
  default     = null
}

variable "deploy_subscription_level_resources" {
  type        = bool
  description = "Turn on/off resources you might want to deploy only once in a subscription."
  default     = false
}

variable "prefix" {
  type        = string
  description = "Name prefix for all the created resources."
}

variable "vnet_rules" {
  description = "The virtual network rules to add to the Azure Data Factory sql server."
  type = list(object({
    name = string,
    id   = string,
  }))
  default = []
}

variable "databricks_connector_id" {
  type        = string
  description = "ID of the Databricks Access Connector."
}

variable "databricks_connector_principal_id" {
  type        = string
  description = "Principal ID to be used for Databricks Access Connector."
}

variable "adf_alerting_enabled" {
  description = "Determines if the alerting for ADF will be enabled or not."
  type        = bool
  default     = true
}

variable "adf_alerting_email_addresses" {
  description = "List of email addresses to send alerts to (when alerting_enabled=true)."
  type        = list(string)
  default     = []
}

variable "databricks_compute_autotermination_minutes" {
  type        = number
  description = "Auto termination time for the compute (clusters and SQL endpoints) in minutes."
  default     = 10
}
