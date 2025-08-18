output "Bastion" {
  value       = azurerm_bastion_host.this.id
  description = "The ID of the Bastion Host."
}

output "bastion_dns_name" {
  value       = azurerm_bastion_host.this.dns_name
  description = "The FQDN for the Bastion Host."
}