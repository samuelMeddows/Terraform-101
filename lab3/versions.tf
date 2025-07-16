terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.36.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6.3"
    }
  }

  backend "azurerm" {
    resource_group_name   = "rg-terraform-state-dev"
    storage_account_name = "sttng86pyq3z"
    container_name        = "tfstate"
    key                   = "obervability-dev"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
    subscription_id = "<sid" 
  
}