terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
}
}

provider "azurerm" {
  features {}

  subscription_id = "a201d6ce-420d-42ed-93d7-34c69de03add"
}



