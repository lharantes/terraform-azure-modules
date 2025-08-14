data "azurerm_private_dns_zone" "dns_zone" {
  name                = "privatelink.api.azureml.ms"
  resource_group_name = var.dns_resource_group_name
}

resource "azurerm_private_endpoint" "this" {
  count                         = var.enable_private_endpoint ? 1 : 0
  location                      = var.location
  name                          = "pep-srch-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${var.environment}"
  resource_group_name           = var.resource_group_name
  subnet_id                     = var.subnet_id
  custom_network_interface_name = "nic-pep-srch-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${var.environment}"
  tags                          = var.tags

  private_service_connection {
    is_manual_connection           = false
    name                           = lower("psc-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${var.environment}")
    private_connection_resource_id = azurerm_search_service.this.id
    subresource_names              = ["searchService"]
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [data.azurerm_private_dns_zone.dns_zone.id]
  }
}