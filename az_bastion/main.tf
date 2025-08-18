resource "azurerm_public_ip" "this" {
  name                = lower("pip-${local.regions}-${var.service_prefix}")
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku_public_ip

  tags = var.tags
}

resource "azurerm_bastion_host" "this" {
  name                = lower("bas-${local.regions}-${var.service_prefix}")
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku_bastion

  ip_configuration {
    name                 = "bastion_ip"
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.this.id
  }

  tags = var.tags
}