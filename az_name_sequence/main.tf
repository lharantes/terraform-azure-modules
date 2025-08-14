data "azurerm_storage_table" "this" {
  name                 = var.table_name
  storage_account_name = var.storage_account_name
}

data "azurerm_storage_table_entity" "this" {
  storage_table_id = data.azurerm_storage_table.this.id
  partition_key    = var.partition_key
  row_key          = var.row_key
}

resource "azurerm_storage_table_entity" "this" {
  storage_table_id = data.azurerm_storage_table.this.id

  partition_key = var.partition_key
  row_key       = var.row_key

  entity = {
    NextSuffix = data.azurerm_storage_table_entity.this.entity.NextSuffix + 1
  }
}

