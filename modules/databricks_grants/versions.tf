terraform {
  required_version = ">= 1.4.2"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
  }
}
