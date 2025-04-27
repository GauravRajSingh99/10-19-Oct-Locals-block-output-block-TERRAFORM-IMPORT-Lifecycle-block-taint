variable "rg_name" {}
variable "location" {}
variable "st_name" {}
variable "app_code" {}
variable "cost_center" {}
variable "environment" {}
variable "app_id" {}


locals {             #local block created for tags
  common_tags = {         #common tags
    app_code = var.app_code
    cost_center = var.cost_center
    environment = var.environment
    app_id = var.app_id
  }
  st_tags = {          #resource specific tag for storage account as it will reflect only in storage account 
    brand = "adidas"
  }
  rg_tags = {          #resource specific tag for rg as it will reflect only in rg
    size = "8UK"
  }
}
  
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = merge (local.common_tags,local.rg_tags)
}

resource "azurerm_storage_account" "stg" {
  name                     = var.st_name
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "standard"
  account_replication_type = "LRS"
  #tags     = local.common_tags
  tags = merge (local.common_tags, local.st_tags) #using merge terraform function
}

resource "azurerm_virtual_network" "vnet" {
  name                     = "${var.rg_name}-vnet"
  location                 = azurerm_resource_group.rg.location
  resource_group_name      = azurerm_resource_group.rg.name
  address_space            = "[10.0.0.0/16]"
    tags     = local.common_tags
}




