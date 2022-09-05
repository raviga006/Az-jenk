# Configure the azurerm provider source and version requirements 
variable "client_secret" {
  type = string
  sensitive = true
}
 
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
 
  subscription_id = "0a396cb4-0e8c-43fe-86fc-346ce9f7dbb6"
  tenant_id       = "b9fec68c-c92d-461e-9a97-3d03a0f18b82"
  client_id       = "4286d482-63eb-4183-bf00-3c9e3ea89688"
  client_secret   = var.client_secret
}