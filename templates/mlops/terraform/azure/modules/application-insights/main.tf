# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

resource "azurerm_application_insights" "appi" {
  name                = "appi-${var.prefix}-${var.env}-${var.postfix}"
  location            = var.location
  resource_group_name = var.rg_name
  application_type    = "web"

  tags = var.tags
}