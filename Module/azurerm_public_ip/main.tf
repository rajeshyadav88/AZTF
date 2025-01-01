resource "azurerm_public_ip" "pip" {
  name                = "zenai-vm-pip"
  resource_group_name = "zenai-rg"
  location            = "westus"
  allocation_method   = "Static"
}