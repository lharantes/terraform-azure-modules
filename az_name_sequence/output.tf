output "number_suffix" {
  value = format("%04d", azurerm_storage_table_entity.this.entity.NextSuffix)
}