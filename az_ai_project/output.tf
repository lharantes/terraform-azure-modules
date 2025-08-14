output "ai_project_id" {
  value       = azurerm_ai_foundry_project.this.id
  description = "The ID of the AI Foundry Project."
}

output "ai_project_name" {
  value       = azurerm_ai_foundry_project.this.name
  description = "The Name of the AI Foundry Project."
}