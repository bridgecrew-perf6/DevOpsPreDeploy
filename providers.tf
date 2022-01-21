provider "azurerm" {
version = "= 1.31"

  	subscription_id = var.ARM_SUBSCRIPTION_ID
	##object_id 		= var.v_object-id
	client_id 		= var.ARM_CLIENT_ID
	tenant_id		= var.ARM_TENANT_ID
	client_secret 	= var.ARM_CLIENT_SECRET
	
}

provider "azuread" {
	version = "~> 1.4"
}