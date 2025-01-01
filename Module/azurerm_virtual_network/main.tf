resource "azurerm_virtual_network" "vnet" {
    name = "zenai-vnet"
    resource_group_name = "zenai-rg"
    location = "westus"
  address_space = ["10.0.0.0/16"]

}