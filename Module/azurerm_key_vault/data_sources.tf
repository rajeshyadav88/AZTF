# data "azurerm_key_vault" "kv" {
#     name                = "rajkeyvault1245800"
#     resource_group_name = "zenai-rg"
# }
# data "azurerm_key_vault_secret" "username" {
#     name         = "username-secret"
#     key_vault_id = data.azurerm_key_vault.kv.id
# }
# data "azurerm_key_vault_secret" "password" {
#     name         = "password-secret"
#     key_vault_id = data.azurerm_key_vault.kv.id
# }
