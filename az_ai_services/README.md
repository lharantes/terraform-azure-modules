<!-- BEGIN_TF_DOCS -->
# Azure AI Services

O Azure AI services help developers and organizations rapidly create intelligent, cutting-edge, market-ready, and responsible applications with out-of-the-box and prebuilt and customizable APIs and models. Example applications include natural language processing for conversations, search, monitoring, translation, speech, vision, and decision-making.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_ai_services.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ai_services) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Example

This example shows how to deploy the module in its simplest configuration.

```hcl
module "ai_services" {
  source                  = "./ai_services"
  resource_group_name     = azurerm_resource_group.example.name
  location                = azurerm_resource_group.example.location
  environment             = "dev"
  service_prefix          = var.service_prefix
  sku_name                = "S0"
  enable_private_endpoint = true
  subnet_id               = azurerm_subnet.internal.id
}
``` 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment project (dev, qua or prd). | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the AI Services Account is created. | `string` | n/a | yes |
| <a name="input_service_prefix"></a> [service\_prefix](#input\_service\_prefix) | Prefix or name of the project. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the SKU Name for this AI Services Account. | `string` | n/a | yes |
| <a name="input_custom_subdomain_name"></a> [custom\_subdomain\_name](#input\_custom\_subdomain\_name) | The subdomain name used for token-based authentication. | `string` | `""` | no |
| <a name="input_dns_resource_group_name"></a> [dns\_resource\_group\_name](#input\_dns\_resource\_group\_name) | Private dns for the private endpoint. | `string` | `""` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | Enable a private endpoint connection. | `bool` | `true` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | A identity and possibles values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string), [])<br/>  })</pre> | <pre>{<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_local_authentication_enabled"></a> [local\_authentication\_enabled](#input\_local\_authentication\_enabled) | Specifies whether the Search Service allows authenticating using API Keys? | `bool` | `false` | no |
| <a name="input_outbound_network_access_restricted"></a> [outbound\_network\_access\_restricted](#input\_outbound\_network\_access\_restricted) | Whether outbound network access is restricted for the AI Services Account. | `bool` | `false` | no |
| <a name="input_public_network_access"></a> [public\_network\_access](#input\_public\_network\_access) | Whether public network access is allowed for the AI Services Account. | `string` | `"Disabled"` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | Storage account to be used for Ai Search Service. | <pre>object({<br/>    storage_account_id = string<br/>    identity_client_id = optional(string, null)<br/>  })</pre> | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for the private endpoint. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional tags to add to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ai_services_endpoint"></a> [ai\_services\_endpoint](#output\_ai\_services\_endpoint) | The endpoint used to connect to the AI Services Account. |
| <a name="output_ai_services_id"></a> [ai\_services\_id](#output\_ai\_services\_id) | The ID of the AI Services Account. |
| <a name="output_ai_services_name"></a> [ai\_services\_name](#output\_ai\_services\_name) | The Name of the AI Services Account. |
<!-- END_TF_DOCS -->
