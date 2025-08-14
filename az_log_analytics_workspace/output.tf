output "log_analytics_id" {
  value       = azurerm_log_analytics_workspace.this.id
  description = "The Log Analytics Workspace ID."
}

output "log_analytics_workspace_id" {
  value       = azurerm_log_analytics_workspace.this.workspace_id
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
}