variable "environment" {
  type        = string
  description = "Environment project (dev, qua or prd)."
}

variable "service_prefix" {
  type        = string
  description = "Prefix or name of the project."
}

variable "location" {
  type        = string
  description = "Specifies the supported Azure location where the resource exists."
}

variable "region_abbreviations" {
  type        = map(string)
  description = "Map of Azure locations to abbreviations. Recommended to pass from the shared modules/region-abbreviations module."
}

variable "hub_id" {
  type        = string
  description = "The AI Foundry ID under which this Project should be created."
}

### Optional Variables

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string), [])
  })
  default = {
    type = "SystemAssigned"
  }
  description = "A identity and possibles values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned."

  validation {
    condition     = contains(["SystemAssigned", "UserAssigned", "SystemAssigned, UserAssigned"], var.identity.type)
    error_message = "Possible values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned."
  }
}

variable "friendly_name" {
  type        = string
  description = "The display name of this AI Project."
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to add to resources."
}