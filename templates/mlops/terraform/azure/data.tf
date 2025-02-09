# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0


data "azurerm_client_config" "current" {}

data "http" "ip" {
  url = "https://ifconfig.me"
}