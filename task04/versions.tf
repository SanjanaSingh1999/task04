terraform {
  required_version = ">= 1.5.7"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.76.0" # Or the latest compatible version used in your environment
    }
  }
}

provider "azurerm" {
  features {}
}
