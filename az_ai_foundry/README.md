<!-- BEGIN_TF_DOCS -->
# Azure Ai Foundry (Hub)

O Azure AI Foundry é uma oferta unificada de plataforma como serviço do Azure para operações
corporativas de IA, construtores de modelos e desenvolvimento de aplicativos. Essa base combina a
infraestrutura de nível de produção com interfaces amigáveis, permitindo que os desenvolvedores se
concentrem na criação de aplicativos em vez de gerenciar a infraestrutura.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_ai_foundry.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ai_foundry) | resource |
| [azurerm_application_insights.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights) | resource |
| [azurerm_log_analytics_workspace.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_private_dns_zone.dns_zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/private_dns_zone) | data source |

## Example

This example shows how to deploy the module in its simplest configuration.

```hcl
module "foundry" {
  source                  = "./ai_foundry"
  resource_group_name     = azurerm_resource_group.example.name
  location                = azurerm_resource_group.example.location
  environment             = "dev"
  service_prefix          = var.service_prefix
  key_vault_id            = azurerm_key_vault.example.id
  storage_account_id      = azurerm_storage_account.example.id
  enable_private_endpoint = true
  subnet_id               = azurerm_subnet.internal.id
  identity = {
    type = "SystemAssigned"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment project (dev, qua or prd). | `string` | n/a | yes |
| <a name="input_key_vault_id"></a> [key\_vault\_id](#input\_key\_vault\_id) | The Key Vault ID that should be used by this AI Foundry Hub. Changing this forces a new AI Foundry Hub to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the AI Foundry Hub should exist. Changing this forces a new AI Foundry Hub to be created. | `string` | n/a | yes |
| <a name="input_service_prefix"></a> [service\_prefix](#input\_service\_prefix) | Prefix or name of the project. | `string` | n/a | yes |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The Storage Account ID that should be used by this AI Foundry Hub. Changing this forces a new AI Foundry Hub to be created. | `string` | n/a | yes |
| <a name="input_application_insights"></a> [application\_insights](#input\_application\_insights) | There is a Application Insights ID that should be used by this AI Foundry Hub. | `bool` | `true` | no |
| <a name="input_application_type"></a> [application\_type](#input\_application\_type) | Specifies the type of Application Insights to create. | `string` | `"web"` | no |
| <a name="input_dns_resource_group_name"></a> [dns\_resource\_group\_name](#input\_dns\_resource\_group\_name) | Private dns for the private endpoint. | `string` | `""` | no |
| <a name="input_enable_private_endpoint"></a> [enable\_private\_endpoint](#input\_enable\_private\_endpoint) | Enabled private endpoint connection. | `bool` | `true` | no |
| <a name="input_friendly_name"></a> [friendly\_name](#input\_friendly\_name) | The display name of this AI Foundry Hub. | `string` | `""` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | A identity and possibles values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string), [])<br/>  })</pre> | <pre>{<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_managed_network"></a> [managed\_network](#input\_managed\_network) | Different configuration modes for outbound traffic from the managed virtual network. | `string` | `"Disabled"` | no |
| <a name="input_public_network_access"></a> [public\_network\_access](#input\_public\_network\_access) | Whether public network access for this AI Service Hub should be enabled. | `string` | `"Disabled"` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the retention period in days. | `number` | `90` | no |
| <a name="input_sku_log_analytics"></a> [sku\_log\_analytics](#input\_sku\_log\_analytics) | Specifies the SKU of the Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for the private endpoint. | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional tags to add to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ai_foundry_discovery_url"></a> [ai\_foundry\_discovery\_url](#output\_ai\_foundry\_discovery\_url) | The URL for the discovery service to identify regional endpoints for AI Foundry Hub services. |
| <a name="output_ai_foundry_id"></a> [ai\_foundry\_id](#output\_ai\_foundry\_id) | The ID of the AI Foundry Hub. |
| <a name="output_ai_foundry_workspace_id"></a> [ai\_foundry\_workspace\_id](#output\_ai\_foundry\_workspace\_id) | The immutable ID associated with this AI Foundry Hub. |
<!-- END_TF_DOCS -->