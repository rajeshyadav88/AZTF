resource "azurerm_network_interface" "nic" {
  name                = "zenaivm-nic"
  location            = "westus"
  resource_group_name = "zenai-rg"

  ip_configuration {
    name                          = "zenips"
    subnet_id                     = data.azurerm_subnet.frontend_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip.id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-nic-assoc" {

  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}