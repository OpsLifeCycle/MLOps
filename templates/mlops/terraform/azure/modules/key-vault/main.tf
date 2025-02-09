# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                = "kv-${var.prefix}-${var.env}-${var.postfix}"
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  tags = var.tags
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}