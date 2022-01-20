resource "azurerm_storage_account" "r_PreDevStorage" {
  name                     = var.PreDevStorageAccountName
 resource_group_name       = azurerm_resource_group.r_PreDevRG.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  account_kind             = "Storage"
}

resource "azurerm_storage_container" "r_storageaccountcontainer" {
  name                  = var.StorageAccountContainerName
   resource_group_name       = var.PreDevResourceGroupName
  storage_account_name  = azurerm_storage_account.r_PreDevStorage.name
  container_access_type = "private"
}