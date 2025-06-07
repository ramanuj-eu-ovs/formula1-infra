terraform {
  required_version = ">= 1.4.2"

  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.33.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47.0"
    }
  }
}
