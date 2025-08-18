resource "azurerm_network_security_group" "this" {
  name                = lower("nsg-${local.regions}-${var.service_prefix}-${var.environment}")
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_network_security_rule" "this" {
  for_each                                   = var.security_rules
  name                                       = each.key
  access                                     = each.value.access
  direction                                  = each.value.direction
  priority                                   = each.value.priority
  protocol                                   = each.value.protocol
  description                                = each.value.description
  destination_address_prefix                 = each.value.destination_address_prefix
  destination_address_prefixes               = each.value.destination_address_prefixes
  destination_application_security_group_ids = each.value.destination_application_security_group_ids
  destination_port_range                     = each.value.destination_port_range
  destination_port_ranges                    = each.value.destination_port_ranges
  source_address_prefix                      = each.value.source_address_prefix
  source_address_prefixes                    = each.value.source_address_prefixes
  source_application_security_group_ids      = each.value.source_application_security_group_ids
  source_port_range                          = each.value.source_port_range
  source_port_ranges                         = each.value.source_port_ranges

  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name

  depends_on = [azurerm_network_security_group.this]
}

resource "azurerm_subnet_network_security_group_association" "subnet_nsg" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.this.id
}