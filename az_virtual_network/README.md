<!-- BEGIN_TF_DOCS -->
# Azure Virtual Network

Azure Virtual Network provides the fundamental building block for your private network in Azure. This service enables Azure resources to securely communicate with each other, the internet, and on-premises networks. Virtual networks deliver the scale, availability, and isolation benefits of Azure infrastructure while maintaining the familiar networking concepts you use in traditional datacenters.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Example

This example shows how to deploy the module in its simplest configuration.

```hcl
module "vnet" {
  source = "./modules/az_virtual_network"

  service_prefix            = var.service_prefix
  location                  = azurerm_resource_group.this.location
  resource_group_name       = azurerm_resource_group.this.name
  dns_server                = ["10.123.123.0/24"]
  address_space             = var.address_space

  subnet                    = {
    resources = {
        address_prefixes    = "10.123.123.0/24"
        service_endpoints   = ["Microsoft.Storage", "Microsoft.ContainerRegistry"]
    }
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment project (dev, qua or prd). | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_region_abbreviations"></a> [region\_abbreviations](#input\_region\_abbreviations) | Map of Azure locations to abbreviations. Recommended to pass from the shared modules/region-abbreviations module. | `map(string)` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the AI Foundry Hub should exist. Changing this forces a new AI Foundry Hub to be created. | `string` | n/a | yes |
| <a name="input_service_prefix"></a> [service\_prefix](#input\_service\_prefix) | Prefix or name of the project. | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | A map of subnets for Virtual Network | <pre>object({<br>    address_prefix   = string<br>    service_endpoint = optional(list(string), null)<br>  })</pre> | n/a | yes |
| <a name="input_vnet_address_prefix"></a> [vnet\_address\_prefix](#input\_vnet\_address\_prefix) | Virtual Network address prefix | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Virtual Network DNS Server | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional tags to add to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
<!-- END_TF_DOCS -->