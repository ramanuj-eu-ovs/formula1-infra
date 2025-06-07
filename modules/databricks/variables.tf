variable "databricks_workspace_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "location" {
  type = string
}

variable "databricks_sku" {
  type    = string
  default = "premium"
}

variable "tags" {
  type    = map(string)
  default = {}
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
    name      = string,
    subnet_id = string
  })
  default = null
}

variable "no_public_ip" {
  type    = bool
  default = false
}
