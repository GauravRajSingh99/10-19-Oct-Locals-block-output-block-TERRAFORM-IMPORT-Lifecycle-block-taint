resource "azurerm_resource_group" "main" {
    name = "rg1"
    location = "westus"
}

# output "resource_group_id" {          #output block 
#     value = azurerm_resource_group.main.id
# }

resource "azurerm_virtual_network" "vnet" {
  name                = "dhondhu-vnet"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
  }
}

output "vnet_id" {          #output block 
    value = azurerm_virtual_network.vnet.id
}

output "subnet1_id" {          #output block 
    value = element(tolist(azurerm_virtual_network.vnet.subnet),0).id
}

output "subnet2_id" {          #output block 
    value = element(tolist(azurerm_virtual_network.vnet.subnet),1).id
}

