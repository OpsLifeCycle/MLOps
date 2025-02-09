# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

output "name" {
  value = azurerm_resource_group.adl_rg.name
}

output "location" {
  value = azurerm_resource_group.adl_rg.location
}