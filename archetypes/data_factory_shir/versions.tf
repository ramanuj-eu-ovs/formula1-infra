terraform {
  required_version = ">= 1.4.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.10.0"
    }
  }
}
