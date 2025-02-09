# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

data "azurerm_client_config" "current" {}

resource "azurerm_kusto_cluster" "cluster" {
  name                = "adx${var.prefix}-${var.env}-${var.postfix}"
  location            = var.location
  resource_group_name = var.rg_name
  streaming_ingestion_enabled = true
  language_extensions {
      name  = "PYTHON"
      image = "Python3_10_8"
  }
  count               = var.enable_monitoring ? 1 : 0

  sku {
    name     = "Dev(No SLA)_Standard_E2a_v4"
    capacity = 2
  }
  tags = var.tags
}

resource "azurerm_kusto_database" "database" {
  name                = "mlmonitoring"
  resource_group_name = var.rg_name
  location            = var.location
  cluster_name        = azurerm_kusto_cluster.cluster[0].name
  count               = var.enable_monitoring ? 1 : 0
}

resource "azurerm_key_vault_secret" "SP_ID" {
  name         = "kvmonitoringspid"
  value        = data.azurerm_client_config.current.client_id
  key_vault_id = var.key_vault_id
  count               = var.enable_monitoring ? 1 : 0
}

resource "azurerm_key_vault_secret" "SP_KEY" {
  name         = "kvmonitoringspkey"
  value        = trim(var.client_secret, "'")
  key_vault_id = var.key_vault_id
  count               = var.enable_monitoring ? 1 : 0
}

resource "azurerm_key_vault_secret" "SP_TENANT_ID" {
  name         = "kvmonitoringadxtenantid"
  value        = data.azurerm_client_config.current.tenant_id
  key_vault_id = var.key_vault_id
  count               = var.enable_monitoring ? 1 : 0
}

resource "azurerm_key_vault_secret" "ADX_URI" {
  name         = "kvmonitoringadxuri"
  value        = azurerm_kusto_cluster.cluster[0].uri
  key_vault_id = var.key_vault_id
  count               = var.enable_monitoring ? 1 : 0
}

resource "azurerm_key_vault_secret" "ADX_DB" {
  name         = "kvmonitoringadxdb"
  value        = azurerm_kusto_database.database[0].name
  key_vault_id = var.key_vault_id
  count               = var.enable_monitoring ? 1 : 0
}