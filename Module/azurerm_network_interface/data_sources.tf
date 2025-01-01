data "azurerm_public_ip" "pip" {
    name                = "zenai-vm-pip"
    resource_group_name = "zenai-rg"
}
data "azurerm_subnet" "frontend_subnet" {
    name                 = "frontend-subnet"
    virtual_network_name = "zenai-vnet"
    resource_group_name  = "zenai-rg"
}
data "azurerm_network_security_group" "nsg" {
  name                = "zenai-nsg"
  resource_group_name = "zenai-rg"
}