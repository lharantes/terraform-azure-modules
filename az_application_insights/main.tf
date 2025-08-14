/**
 * # Azure Application Insights
 *
 * Azure Application Insights is a monitoring and performance analytics service that collects application telemetry to help detect, diagnose, and troubleshoot issues in real time.
 */

resource "azurerm_application_insights" "this" {
  name                = lower("appi-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${var.environment}")
  location            = var.location
  resource_group_name = var.resource_group_name
  workspace_id        = var.log_analytics_workspace
  retention_in_days   = var.retention_in_days
  application_type    = var.application_type
}