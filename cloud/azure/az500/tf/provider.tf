terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  skip_provider_registration = "false"
}

#az group show --name 1-c01f8c80-playground-sandbox  --query id --output tsv
##/subscriptions/964df7ca-3ba4-48b6-a695-1ed9db5723f8/resourceGroups/1-c01f8c80-playground-sandbox


resource "azurerm_resource_group" "a1-c01f8c80-playground-sandbox" {}
