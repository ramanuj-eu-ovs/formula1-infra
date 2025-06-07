variable "key_vault_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "aad_admin_ids" {
  type    = map(string)
  default = {}
}

variable "aad_reader_ids" {
  type    = map(string)
  default = {}
}

variable "tenant_id" {
  type = string
}

variable "purge_protection_enabled" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "private_endpoint" {
  type = object({
    name      = string,
    subnet_id = string
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
