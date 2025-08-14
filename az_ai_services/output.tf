output "ai_services_id" {
  value       = azurerm_ai_services.this.id
  description = "The ID of the AI Services Account."
}

output "ai_services_name" {
  value       = azurerm_ai_services.this.name
  description = "The Name of the AI Services Account."
}

output "ai_services_endpoint" {
  value       = azurerm_ai_services.this.endpoint
  description = "The endpoint used to connect to the AI Services Account."
}