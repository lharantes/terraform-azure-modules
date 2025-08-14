resource "azurerm_mysql_flexible_server_configuration" "example" {
  for_each = var.server_configuration

  name                = each.value.name
  resource_group_name = azurerm_mysql_flexible_server.this.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name
  value               = each.value.value
}
