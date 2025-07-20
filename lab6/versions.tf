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
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }

  }
  backend "azurerm" {
    
  }

}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  }