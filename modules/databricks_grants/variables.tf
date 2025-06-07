variable "grants_config" {
  type        = string
  description = "YAML file containing the grants configuration"
}

variable "catalog" {
  type        = string
  description = "Name of the catalog to which you want to grant permisions"
}

variable "schemas" {
  type        = map(string)
  description = "The map of schemas to grant permissions to. key = same as config, value = schema as in metastore"
}

variable "locations" {
  type        = map(string)
  description = "The map of locations to grant permissions to. key = same as config, value = location as in metastore"
}
