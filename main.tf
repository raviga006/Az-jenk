terraform{
    required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
      }
    }
    backend "azurerm" {
        resource_group_name = "polo"
        storage_account_name = "terrasave"
        container_name = "tfback"
        key = "prod.terraform.tfstate" 
    }
}

resource "azurerm_resource_group" "polo"{
    name = "polo-1"
    location = "South India"
}
