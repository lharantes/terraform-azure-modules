<!-- BEGIN_TF_DOCS -->
# Azure Search Service

O Azure AI Search é uma infraestrutura de pesquisa escalonável que indexa conteúdo heterogêneo e permite a recuperação por meio de APIs, aplicativos e agentes de IA.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_search_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/search_service) | resource |
| [azurerm_private_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Example

This example shows how to deploy the module in its simplest configuration.

```hcl
module "ai_search_services" {
  source                        = "./ai_search_service"
  resource_group_name           = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  environment                   = "dev"
  service_prefix                = var.service_prefix
  public_network_access_enabled = false
  enable_private_endpoint       = false
  sku                           = "standard"
  partition_count               = 1
  replica_count                 = 1
  semantic_search_sku           = "standard"
  hosting_mode                  = "default"
}
``` 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment project (dev, qua or prd) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Search Service should exist. Changing this forces a new AI Foundry Hub to be created. | `string` | n/a | yes |
| <a name="input_service_prefix"></a> [service\_prefix](#input\_service\_prefix) | Prefix or name of the project | `string` | n/a | yes |
| <a name="input_dns_resource_group_name"></a> [dns\_resource\_group\_name](#input\_dns\_resource\_group\_name) | DNS zone for the private endpoint. | `string` | `""` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | Create a private endpoint to resource | `bool` | `true` | no |
| <a name="input_hosting_mode"></a> [hosting\_mode](#input\_hosting\_mode) | Specifies the Hosting Mode, which allows for High Density partitions (that allow for up to 1000 indexes) should be supported. | `string` | `"default"` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | A identity and possibles values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned. | <pre>list(object({<br/>    type         = string<br/>    identity_ids = optional(list(string), [])<br/>  }))</pre> | <pre>{<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_local_authentication_enabled"></a> [local\_authentication\_enabled](#input\_local\_authentication\_enabled) | Specifies whether the Search Service allows authenticating using API Keys? | `bool` | `false` | no |
| <a name="input_partition_count"></a> [partition\_count](#input\_partition\_count) | Specifies the number of partitions which should be created. This field cannot be set when using a free sku. | `number` | `1` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | pecifies whether Public Network Access is allowed for this resource. | `bool` | `false` | no |
| <a name="input_replica_count"></a> [replica\_count](#input\_replica\_count) | Specifies the number of Replica's which should be created for this Search Service. | `number` | `0` | no |
| <a name="input_semantic_search_sku"></a> [semantic\_search\_sku](#input\_semantic\_search\_sku) | Specifies the Semantic Search SKU which should be used for this Search Service. | `string` | `""` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU which should be used for this Search Service. | `string` | `"basic"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for the private endpoint. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional tags to add to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_search_service_id"></a> [search\_service\_id](#output\_search\_service\_id) | The ID of the Search Service. |
| <a name="output_search_service_name"></a> [search\_service\_name](#output\_search\_service\_name) | The Name of the Search Service. |
<!-- END_TF_DOCS -->