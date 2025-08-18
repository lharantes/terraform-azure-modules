/**
 * # Azure Key Vault
 *
 * Azure Key Vault is a Microsoft Azure service that serves as a secure, centralized repository for storing the secrets, keys, and certificates that applications and services need to operate.
 */

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = lower("kv-bdso-${local.regions}-${var.service_prefix}-${var.environment}")
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  enable_rbac_authorization     = var.enable_rbac_authorization
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  public_network_access_enabled = var.public_network_access_enabled
  sku_name                      = var.sku_name

  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}