resource "azurerm_subnet" "this" {
  for_each = {
    for key, value in var.var.subnet :
    key => value
  }

  name                 = lower("vnet-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${each.key}")
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value.address_prefixes]
  service_endpoints    = each.value.service_endpoints != null ? each.value.service_endpoints : null
}