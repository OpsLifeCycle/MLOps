# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

resource "azurerm_resource_group" "adl_rg" {
  name     = "rg-${var.prefix}-${var.env}-${var.postfix}"
  location = var.location
  tags     = var.tags
}