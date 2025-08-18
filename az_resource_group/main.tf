resource "azurerm_resource_group" "this" {
  name     = lower("rg-${local.regions}-${var.service_prefix}-${var.environment}")
  location = var.location
}