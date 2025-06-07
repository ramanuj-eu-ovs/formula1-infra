terraform {
  // For local development (eg running plan), comment out this line
  backend "azurerm" {}
}
provider "azurerm" {
  skip_provider_registration = true
  features {}
}

provider "databricks" {
  azure_workspace_resource_id = module.databricks_datalake.id
}
