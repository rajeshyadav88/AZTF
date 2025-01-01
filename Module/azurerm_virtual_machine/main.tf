# Prerequisite> Subnet ID extraction
# data "azurerm_subnet" "frontend_subnet" {
#   name                 = "frontend-subnet"
#   virtual_network_name = "zenai-vnet"
#   resource_group_name  = "zenai-rg"
# }

#Public IP creations
# resource "azurerm_public_ip" "pip" {
#   name                = "zenai-vm-pip"
#   resource_group_name = "zenai-rg"
#   location            = "westus"
#   allocation_method   = "Static"
# }

#NIC creation
# resource "azurerm_network_interface" "nic" {
#   name                = "zenaivm-nic"
#   location            = "westus"
#   resource_group_name = "zenai-rg"

#   ip_configuration {
#     name                          = "zenips"
#     subnet_id = "/subscriptions/78f98668-0eb8-4088-b584-da4b2a96e0bf/resourceGroups/zenai-rg/providers/Microsoft.Network/virtualNetworks/zenai-vnet/subnets/frontend-subnet"
#     #subnet_id                     = data.azurerm_subnet.frontend_subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.pip.id  #simply get the created public_IP's ID as per need
#   }
# }

# VM creation
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "zenaivm"
  resource_group_name             = "zenai-rg"
  location                        = "westus"
  size                            = "Standard_F2"
  admin_username                  = data.azurerm_key_vault_secret.username.value
  admin_password                  = data.azurerm_key_vault_secret.password.value
  disable_password_authentication = false
  network_interface_ids          = [data.azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  
}