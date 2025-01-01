data "azurerm_key_vault" "kv" {
    name                = "rajkeyvault1245801"
    resource_group_name = "zenai-rg"
}
data "azurerm_key_vault_secret" "username" {
  name         = "username-secret"
  key_vault_id = data.azurerm_key_vault.kv.id
}
data "azurerm_key_vault_secret" "password" {
  name         = "password-secret"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_network_interface" "nic" {
  name                = "zenaivm-nic"
  resource_group_name = "zenai-rg"
}
output "azurerm_network_interface" {
  value = data.azurerm_network_interface.nic
  
}
# output "admin_username_value" {
#   value = data.azurerm_key_vault_secret.admin_username.value
# }
# output "admin_password_value" {
#   value = data.azurerm_key_vault_secret.admin_password.value
# }