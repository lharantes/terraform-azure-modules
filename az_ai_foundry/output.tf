output "ai_foundry_discovery_url" {
  value       = azurerm_ai_foundry.this.discovery_url
  description = "The URL for the discovery service to identify regional endpoints for AI Foundry Hub services."
}

output "ai_foundry_id" {
  value       = azurerm_ai_foundry.this.id
  description = "The ID of the AI Foundry Hub."
}

output "ai_foundry_workspace_id" {
  value       = azurerm_ai_foundry.this.workspace_id
  description = "The immutable ID associated with this AI Foundry Hub."
}