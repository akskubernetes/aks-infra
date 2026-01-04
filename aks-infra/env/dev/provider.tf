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

  subscription_id = "6f8da1c9-b993-4f71-b180-2c6245a0833d"
}



