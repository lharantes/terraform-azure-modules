/**
 * # Azure Log Analytics Workspace
 *
 * Azure Log Analytics Workspace is a centralized service for collecting, storing, and analyzing log and telemetry data from various Azure and on-premises resources, enabling advanced queries and unified monitoring.
 */


resource "azurerm_log_analytics_workspace" "this" {
  name                = lower("law-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${var.environment}")
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku_log_analytics
  retention_in_days   = var.retention_in_days

  identity {
    type         = var.identity.type
    identity_ids = var.identity.identity_ids
  }

  tags = var.tags
}