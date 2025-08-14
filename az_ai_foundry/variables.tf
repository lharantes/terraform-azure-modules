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
  description = "The name of the Resource Group where the AI Foundry Hub should exist. Changing this forces a new AI Foundry Hub to be created."
}

variable "key_vault_id" {
  type        = string
  description = "The Key Vault ID that should be used by this AI Foundry Hub. Changing this forces a new AI Foundry Hub to be created."
}

variable "storage_account_id" {
  type        = string
  description = "The Storage Account ID that should be used by this AI Foundry Hub. Changing this forces a new AI Foundry Hub to be created."
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

  validation {
    condition     = contains(["SystemAssigned", "UserAssigned", "SystemAssigned, UserAssigned"], var.identity.type)
    error_message = "Possible values are SystemAssigned, UserAssigned, and SystemAssigned, UserAssigned."
  }
}

### Optional Variables

variable "public_network_access" {
  type        = string
  default     = "Disabled"
  description = "Whether public network access for this AI Service Hub should be enabled."

  validation {
    condition     = contains(["Disabled", "Enabled"], var.public_network_access)
    error_message = "Possible values include Enabled and Disabled."
  }
}

variable "application_insights" {
  type        = bool
  description = "There is a Application Insights ID that should be used by this AI Foundry Hub."
  default     = true
}

variable "friendly_name" {
  type        = string
  description = "The display name of this AI Foundry Hub."
  default     = ""
}

variable "managed_network" {
  type        = string
  default     = "Disabled"
  description = "Different configuration modes for outbound traffic from the managed virtual network."

  validation {
    condition     = contains(["Disabled", "AllowOnlyApprovedOutbound", "AllowInternetOutbound"], var.managed_network)
    error_message = "Possible values are Disabled, AllowOnlyApprovedOutbound, AllowInternetOutbound."
  }
}

variable "enable_private_endpoint" {
  type        = bool
  default     = true
  description = "Enabled private endpoint connection."
}

variable "dns_resource_group_name" {
  type        = string
  default     = ""
  description = "Private dns for the private endpoint."
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "Subnet ID for the private endpoint."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to add to resources."
}

variable "retention_in_days" {
  type        = number
  default     = 90
  description = "Specifies the retention period in days."

  validation {
    condition     = contains([30, 60, 90, 120, 180, 270, 365, 550, 730], var.retention_in_days)
    error_message = "Possible values include 30, 60, 90, 120, 180, 270, 365, 550 or 730."
  }
}

variable "application_type" {
  type        = string
  default     = "web"
  description = "Specifies the type of Application Insights to create."
}

variable "sku_log_analytics" {
  type        = string
  default     = "PerGB2018"
  description = "Specifies the SKU of the Log Analytics Workspace."

  validation {
    condition     = contains(["PerNode", "Standalone", "Unlimited", "CapacityReservation", "PerGB2018", "LACluster"], var.sku_log_analytics)
    error_message = "Possible values are PerNode, Standalone, Unlimited, CapacityReservation, PerGB2018, and LACluster."
  }
}