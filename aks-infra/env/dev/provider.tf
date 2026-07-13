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

  subscription_id = "45a3f38a-c21e-40a2-abc1-03c67c307b06"
}



