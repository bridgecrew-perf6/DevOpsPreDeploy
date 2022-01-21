# Create Key Vault
resource "azurerm_key_vault" "r_PreDevkeyvault" {
  name                        = var.PreDevKeyVaultName
  location                    = azurerm_resource_group.r_PreDevRG.location
  resource_group_name         = azurerm_resource_group.r_PreDevRG.name
  enabled_for_disk_encryption = true
  tenant_id                   = var.ARM_TENANT_ID

  sku_name                    = "standard"
}
/*
resource "azurerm_key_vault_access_policy" "r_PreDevkeyvaultPolicySP" {
  key_vault_id = azurerm_key_vault.r_PreDevkeyvault.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  secret_permissions = [
     "get", "list", "recover", "set",
  ]
}
*/
resource "azurerm_key_vault_access_policy" "r_PreDevkeyvaultPolicyMe" {
  key_vault_id = azurerm_key_vault.r_PreDevkeyvault.id
  tenant_id    = var.ARM_TENANT_ID
  object_id    = var.ARM_OBJECT_ID

  secret_permissions = [
   "get", "list", "recover", "set",
  ]
}

# Create sterrastate-storage-key-02 in Key Vault
resource "azurerm_key_vault_secret" "self_hosted_agent_keyvault_secret_storage" {
  name                        = "terrastate-storage-key-01"
  value                       = azurerm_storage_account.r_PreDevStorage.primary_access_key
  key_vault_id                = azurerm_key_vault.r_PreDevkeyvault.id
}

# Create spn-client-id in Key Vault
resource "azurerm_key_vault_secret" "self_hosted_agent_keyvault_secret_clientid" {
  name                        = "client-id"
  value                       = var.ARM_CLIENT_ID
  key_vault_id                = azurerm_key_vault.r_PreDevkeyvault.id
}

# Create spn-client-secret in Key Vault
resource "azurerm_key_vault_secret" "self_hosted_agent_keyvault_secret_clientsecret" {
  name                        = "client-secret-01"
  value                       = var.ARM_CLIENT_SECRET
  key_vault_id                = azurerm_key_vault.r_PreDevkeyvault.id
}

# Create spn-tenant-id in Key Vault
resource "azurerm_key_vault_secret" "self_hosted_agent_keyvault_secret_tenantid" {
  name                        = "tenant-id-01"
  value                       = var.ARM_TENANT_ID
  key_vault_id                = azurerm_key_vault.r_PreDevkeyvault.id
}

# Create CoreSubscriptionId in Key Vault
resource "azurerm_key_vault_secret" "self_hosted_agent_keyvault_secret_subid" {
  name                        = "CoreSubscriptionId"
  value                       = var.ARM_SUBSCRIPTION_ID
  key_vault_id                = azurerm_key_vault.r_PreDevkeyvault.id
}