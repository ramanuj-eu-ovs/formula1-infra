variable "jars" {
  type        = map(string)
  description = "Mapping of the jars to download: `{'local_name.jar' = 'http://maven.org/package.jar'`}"
}

variable "extra_commands_init_script" {
  type        = list(string)
  default     = []
  description = "List of extra command to pass in the init script"
}

variable "name" {
  type        = string
  description = "Name of this extension"
}

variable "databricks_path" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "storage_container_name" {
  type = string
}