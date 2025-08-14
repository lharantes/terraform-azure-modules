/**
 * # Azure AI Foundry Project
 *
 * Os projetos permitem que você organize seu trabalho para explorar novas ideias e, ao mesmo tempo, fazer protótipos de um caso de uso específico.
 */

resource "azurerm_ai_foundry_project" "this" {
  # Name: proj-brs-genai-dev
  name               = lower("proj-${lookup(local.regions, var.location, false)}-${var.service_prefix}-${var.environment}")
  location           = var.location
  ai_services_hub_id = var.hub_id
  friendly_name      = var.friendly_name != "" ? var.friendly_name : null
  tags               = var.tags

  identity {
    type         = var.identity.type
    identity_ids = var.identity.identity_ids
  }
}