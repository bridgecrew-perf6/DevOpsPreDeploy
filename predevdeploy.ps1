$SPName = "DeploymentSP001test"
$ARM_CLIENT_SECRET= az ad sp create-for-rbac --name $SPName --role Contributor --query password -o tsv
$ARM_TENANT_ID= az account show --query homeTenantId -o tsv
$ARM_CLIENT_ID=az ad app list --display-name $SPName --query [].appId -o tsv
$ARM_SUBSCRIPTION_ID= az account show --query id -o tsv
$ARM_OBJECT_ID=az ad app list --display-name $SPName --query [].objectId -o tsv
Start-Sleep -s 15
terraform plan --var-file=predev.tfvars --var="ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID" --var="ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET" --var="ARM_TENANT_ID=$ARM_TENANT_ID" --var="ARM_CLIENT_ID=$ARM_CLIENT_ID" --var="ARM_OBJECT_ID=$ARM_OBJECT_ID"
terraform apply --var-file=predev.tfvars --var="ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID" --var="ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET" --var="ARM_TENANT_ID=$ARM_TENANT_ID" --var="ARM_CLIENT_ID=$ARM_CLIENT_ID" --var="ARM_OBJECT_ID=$ARM_OBJECT_ID"