resource "azurerm_resource_group" "rg" {
    name = "import"
    location = "eastus"

    tags = {
      app_code = "pehla"
    }
}