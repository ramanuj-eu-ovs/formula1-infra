terraform {
  required_version = ">= 1.4.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.47.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}