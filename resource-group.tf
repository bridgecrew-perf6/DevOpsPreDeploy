# Resource Group
resource "azurerm_resource_group" "r_PreDevRG" {
  name     = var.PreDevResourceGroupName
  location = var.location
}
