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

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which the AI Services Account is created."
}

variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for this AI Services Account."

  validation {
    condition     = contains(["F0", "F1", "S0", "S", "S1", "S2", "S3", "S4", "S5", "S6", "P0", "P1", "P2", "E0", "DC0"], var.sku_name)
    error_message = "Possible values are F0, F1, S0, S, S1, S2, S3, S4, S5, S6, P0, P1, P2, E0 and DC0."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to add to resources."
}

### Optional Variables

variable "custom_subdomain_name" {
  type        = string
  description = "The subdomain name used for token-based authentication."
  default     = ""
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string), [])
  })
  default = {
    type = "SystemAssigned"
  }
  description = "A identity and possibles values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned."

  # validation {
  #   condition     = contains(["SystemAssigned", "UserAssigned", "SystemAssigned, UserAssigned"], var.identity.type)
  #   error_message = "Possible values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned."
  # }
}

variable "local_authentication_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the Search Service allows authenticating using API Keys?"
}

variable "outbound_network_access_restricted" {
  type        = bool
  default     = false
  description = "Whether outbound network access is restricted for the AI Services Account."
}

variable "public_network_access" {
  type        = string
  default     = "Disabled"
  description = "Whether public network access is allowed for the AI Services Account."

  validation {
    condition     = contains(["Enabled", "Disabled"], var.public_network_access)
    error_message = "Possible values are Enabled and Disabled."
  }
}

variable "storage_account" {
  type = object({
    storage_account_id = string
    identity_client_id = optional(string, null)
  })
  default     = null
  description = "Storage account to be used for Ai Search Service."
}

variable "enable_private_endpoint" {
  type        = bool
  default     = true
  description = "Enable a private endpoint connection."
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "Subnet ID for the private endpoint."
}

variable "dns_resource_group_name" {
  type        = string
  default     = ""
  description = "Private dns for the private endpoint."
}