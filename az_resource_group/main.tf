resource "azurerm_resource_group" "this" {
  name     = lower("rg-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${var.environment}")
  location = var.location
}