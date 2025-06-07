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


variable "databricks_sku" {
  type    = string
  default = "premium"
}

variable "vnet" {
  type = object({
    id             = string
    public_subnet  = object({ id = string, name = string, nsg_id = string }),
    private_subnet = object({ id = string, name = string, nsg_id = string })
  })
  description = "The vnet to use for the databricks."
}

variable "private_endpoint" {
  type = object({
    subnet_id = string,
    enabled   = optional(bool, true)
  })
  description = "Subnet ID where to deploy the private endpoint into."
  default     = null
}

variable "metastore_id" {
  type    = string
  default = null
}

variable "spark_conf" {
  description = "Spark configuration to be added to a cluster."
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "Secrets to add."
  type        = list(object({ scope = string, key = string, value = string }))
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Collection of tags that help organizing resources (https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/decision-guides/resource-tagging/?toc=/azure/azure-resource-manager/management/toc.json)."
}

# variable "init_script_volumes" {
#   type        = set(string)
#   description = "Path to init-scripts on volumes to attach to the clusters with unity"
# }

# variable "access_for_service_principals" {
#   type        = set(object({ id = string, client_id = string, principal_id = string, tenant_id = string }))
#   description = "ID's of service principals who get access to this workspace"
# }

variable "autotermination_minutes" {
  type        = number
  description = "Auto termination time for the compute (clusters and SQL endpoints) in minutes."
  default     = 10
}
