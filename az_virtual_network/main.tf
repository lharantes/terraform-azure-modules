/**
 * # Azure Virtual Network
 *
 * Azure Virtual Network provides the fundamental building block for your private network in Azure. This service enables Azure resources to securely communicate with each other, the internet, and on-premises networks. Virtual networks deliver the scale, availability, and isolation benefits of Azure infrastructure while maintaining the familiar networking concepts you use in traditional datacenters.
 */

resource "azurerm_virtual_network" "vnet" {
  name                = lower("vnet-${local.regions}-${var.service_prefix}-${var.environment}")
  address_space       = [var.vnet_address_prefix]
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers

  tags = var.tags

  lifecycle {
    ignore_changes = [tags]
  }
}