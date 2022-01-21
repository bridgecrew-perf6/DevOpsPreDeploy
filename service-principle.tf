
/*
data "azurerm_client_config" "current" {}

data "azuread_service_principal" "exampleSP" {
  application_id  = "2f1e7cfd-dafa-45ef-9efd-510267a4b5a3"
}


resource "azuread_application" "r_enterpriseapplication" {
  display_name = "SPDevOps01"
##  owners       = [data.azurerm_client_config.current.object_id]
}

resource "azuread_service_principal" "r_serviceprinciple" {
  application_id               = azuread_application.r_enterpriseapplication.application_id
  app_role_assignment_required = false
 ## owners                       = [data.azurerm_client_config.current.object_id]


  feature_tags {
    enterprise = true
    gallery    = true
  }
  
}

resource "random_string" "password" {
  length  = 16
  special = true
}

# Create Service Principal password
resource "azuread_service_principal_password" "r_enterpriseapplicationsecret" {
  end_date             =  "2299-12-30T23:00:00Z"
  service_principal_id = data.azuread_service_principal.exampleSP.application_id
  value                = random_string.password.result
}


data "azuread_service_principal_password" "Serviceprincipalpass" {
  object_id = "b432a130-6571-4969-b2de-9d5b6eb79413"
}
*/