# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

terraform {
  backend "azurerm" {} 
  required_providers {
    azurerm = {
      version = "= 4.15.0"
    }
  }
}

provider "azurerm" {
  features {}
}