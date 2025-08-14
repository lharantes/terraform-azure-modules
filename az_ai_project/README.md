<!-- BEGIN_TF_DOCS -->
# Azure AI Foundry Project

Os projetos permitem que você organize seu trabalho para explorar novas ideias e, ao mesmo tempo, fazer protótipos de um caso de uso específico.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.38.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_ai_foundry_project.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/ai_foundry_project) | resource |

## Example

This example shows how to deploy the module in its simplest configuration.

```hcl
module "project" {
  source         = "./ai_project"
  location       = azurerm_resource_group.example.location
  environment    = "dev"
  service_prefix = var.service_prefix
  hub_id         = module.foundry.ai_foundry_id
  identity = {
    type = "SystemAssigned"
  }
}
``` 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment project (dev, qua or prd). | `string` | n/a | yes |
| <a name="input_hub_id"></a> [hub\_id](#input\_hub\_id) | The AI Foundry ID under which this Project should be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the resource exists. | `string` | n/a | yes |
| <a name="input_service_prefix"></a> [service\_prefix](#input\_service\_prefix) | Prefix or name of the project. | `string` | n/a | yes |
| <a name="input_friendly_name"></a> [friendly\_name](#input\_friendly\_name) | The display name of this AI Project. | `string` | `""` | no |
| <a name="input_identity"></a> [identity](#input\_identity) | A identity and possibles values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned. | <pre>object({<br/>    type         = string<br/>    identity_ids = optional(list(string), [])<br/>  })</pre> | <pre>{<br/>  "type": "SystemAssigned"<br/>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Optional tags to add to resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ai_project_id"></a> [ai\_project\_id](#output\_ai\_project\_id) | The ID of the AI Foundry Project. |
| <a name="output_ai_project_name"></a> [ai\_project\_name](#output\_ai\_project\_name) | The Name of the AI Foundry Project. |
<!-- END_TF_DOCS -->