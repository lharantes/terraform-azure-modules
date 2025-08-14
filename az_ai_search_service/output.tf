output "search_service_id" {
  value       = azurerm_search_service.this.id
  description = "The ID of the Search Service."
}

output "search_service_name" {
  value       = azurerm_search_service.this.name
  description = "The Name of the Search Service."
}