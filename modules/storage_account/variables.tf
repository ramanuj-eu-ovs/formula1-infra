variable "storage_account_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "account_kind" {
  type    = string
  default = "StorageV2"
}

variable "is_hns_enabled" {
  type    = bool
  default = true
}

variable "enable_static_website" {
  type    = bool
  default = false
}

variable "index_document" {
  type    = string
  default = "index.html"
}

variable "location" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "storage_contributors" {
  type    = map(string)
  default = {}
}

variable "adls_file_systems" {
  type        = list(string)
  description = "List of adls gen2 file systems."
  default     = []
}

variable "blob_file_systems" {
  type        = list(string)
  description = "List of blob file systems."
  default     = []
}

variable "vnet_rules" {
  description = "The virtual network rules to whitelist."
  type = list(object({
    name = string,
    id   = string,
  }))
  default = []
}

variable "private_endpoint" {
  type = object({
    name      = string,
    subnet_id = string
  })
  default = null
}
