terraform {
  required_version = ">= 1.4.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.78.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.9.1"
    }
  }
}