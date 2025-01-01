
resource "azurerm_key_vault" "kv" {
  name                = "rajkeyvault1245801"
  location            = "westus"
  resource_group_name = "zenai-rg"
  sku_name            = "standard"
  tenant_id           = "a18755cc-5629-4c95-9d78-318b6370df56"

  access_policy {
    tenant_id          = "a18755cc-5629-4c95-9d78-318b6370df56"
    object_id          = "4bd95d99-295c-45d2-b665-8fd75abc73d4" # Replace with the actual object ID
    key_permissions    = ["Get", "List", "Create", "Delete", "Update", "Import", "Backup", "Restore", "Purge",  "Recover",]
    secret_permissions = ["Get", "List", "Set", "Delete", "Backup", "Restore", "Recover","Purge", ]
  }
}

resource "azurerm_key_vault_secret" "username" {
  name         = "username-secret"
  value        = "devopsadmin"
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [ azurerm_key_vault.kv ]
}
resource "azurerm_key_vault_secret" "password" {
  name         = "password-secret"
  value        = "Passw@rd123"
  key_vault_id = azurerm_key_vault.kv.id
  depends_on = [ azurerm_key_vault.kv ]
}
