output "application_insights_app_id" {
  value       = azurerm_application_insights.this.app_id
  description = "The App ID associated with this Application Insights component."
}

output "application_insights_id" {
  value       = azurerm_application_insights.this.id
  description = "The ID of the Application Insights component."
}