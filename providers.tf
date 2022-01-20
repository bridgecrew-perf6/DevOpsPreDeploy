provider "azurerm" {
version = "= 1.31"
/*
  	subscription_id = "${env.ARM_SUBSCRIPTION_ID}"
	##object_id 		= var.v_object-id
	client_id 		= "${env.ARM_CLIENT_ID}"
	tenant_id		= "${env.ARM_TENANT_ID}"
	client_secret 	= "${env.ARM_CLIENT_SECRET }"
	*/
}

provider "azuread" {
	version = "~> 1.4"
}