resource "azurerm_route_table" "route_table" {
  name                = var.route_table_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  tags                = var.tags

  dynamic "route" {
    for_each = var.routes
    content {
      name                   = route.value.route_name
      address_prefix         = route.value.address_prefix
      next_hop_type          = route.value.next_hop_type
      next_hop_in_ip_address = route.value.next_hop_ip != "" ? route.value.next_hop_ip : null
    }
  }
}

resource "azurerm_subnet_route_table_association" "route_table_association" {
  for_each       = var.subnet_id
  subnet_id      = each.value
  route_table_id = azurerm_route_table.route_table.id
}

