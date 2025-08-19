# This allow use to randomize the name of resources
resource "random_string" "this" {
  length  = 4
  special = false
  upper   = false
}

resource "azurerm_storage_account" "this" {
  name                     = lower("st${local.regions}${var.service_prefix}${var.environment}${random_string.this.result}")
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_kind             = var.account_kind
  access_tier              = var.account_kind == "BlockBlobStorage" && var.account_tier == "Premium" ? null : var.access_tier
  account_replication_type = var.account_replication_type

  tags = var.tags

  public_network_access_enabled = var.public_network_access_enabled
  large_file_share_enabled      = var.large_file_share_enabled
  is_hns_enabled                = var.is_hns_enabled
  sftp_enabled                  = var.sftp_enabled


}