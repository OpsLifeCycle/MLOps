# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

locals {
  safe_prefix  = replace(var.prefix, "-", "")
  safe_postfix = replace(var.postfix, "-", "")
}

resource "azurerm_container_registry" "cr" {
  name                = "cr${local.safe_prefix}${var.env}${local.safe_postfix}"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Standard"
  admin_enabled       = true

  tags = var.tags
}