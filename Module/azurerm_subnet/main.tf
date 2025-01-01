resource "azurerm_subnet" "frontend_subnet" {
    name = "frontend-subnet"
    virtual_network_name = "zenai-vnet"
    resource_group_name = "zenai-rg"
    address_prefixes = ["10.0.1.0/26"]
}
resource "azurerm_subnet" "backend_subnet" {
    name = "backend-subnet"
    virtual_network_name = "zenai-vnet"
    resource_group_name = "zenai-rg"
    address_prefixes = ["10.0.2.0/26"]
}
