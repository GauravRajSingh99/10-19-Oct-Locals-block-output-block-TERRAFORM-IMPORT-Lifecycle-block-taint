terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.6.0"
    }  
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1d94d08b-e5d6-4ac8-a148-ebfdbe3aaa1a"
}