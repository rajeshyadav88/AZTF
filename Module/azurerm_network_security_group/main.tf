resource "azurerm_network_security_group" "nsg" {
  name                = "zenai-nsg"
  location            = "westus"
  resource_group_name = "zenai-rg"

  security_rule {
    name                       = "sec"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}