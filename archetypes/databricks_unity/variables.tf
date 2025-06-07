variable "naming" {
  type = object({
    prefix = list(string)
    suffix = list(string)
  })
}

variable "catalog" {
  type = object({
    name      = string,
    container = string,
    schemas   = set(string),
    volumes = set(object({
      schema    = string,
      name      = string,
      container = string
    }))
  })
}

variable "grants_config" {
  type        = string
  description = "YAML file containing the grants configuration"
  default     = null
}

variable "storage_account" {
  type = object({
    name           = string,
    resource_group = string,
    containers     = set(string)
  })
}

variable "databricks_connector" {
  type = object({
    id           = string,
    principal_id = string
  })
}

variable "storage_account_id" {
  type        = string
  description = "Storage account tied to unity catalog"

}