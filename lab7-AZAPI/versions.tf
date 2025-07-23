terraform {
    required_providers {
        azapi = {
            source  = "Azure/azapi"
            version = "~> 2.5.0"
        }
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>4.37.0"
        }
        local = {
            source  = "hashicorp/local"
            version = "~> 2.0"
        }
    }
}

provider "azapi" {
  
}

provider "azurerm" {
  features {}
}
