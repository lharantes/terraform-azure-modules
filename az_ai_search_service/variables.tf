variable "environment" {
  type        = string
  description = "Environment project (dev, qua or prd)"
}

variable "service_prefix" {
  type        = string
  description = "Prefix or name of the project"
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
  description = "The name of the Resource Group where the Search Service should exist. Changing this forces a new AI Foundry Hub to be created."
}

variable "sku" {
  type        = string
  default     = "basic"
  description = "The SKU which should be used for this Search Service."

  validation {
    condition     = contains(["basic", "free", "standard", "standard2", "standard3", "storage_optimized_l1", "storage_optimized_l2"], var.sku)
    error_message = "Possible values include basic, free, standard, standard2, standard3, storage_optimized_l1 and storage_optimized_l2."
  }
}

### Optional Variables

variable "partition_count" {
  type        = number
  default     = 1
  description = "Specifies the number of partitions which should be created. This field cannot be set when using a free sku."

  validation {
    condition     = contains([1, 2, 3, 4, 6, 12], var.partition_count)
    error_message = "This field cannot be set when using a free sku. Possible values include 1, 2, 3, 4, 6, or 12."
  }
}

variable "replica_count" {
  type        = number
  default     = 0
  description = "Specifies the number of Replica's which should be created for this Search Service."
}

variable "semantic_search_sku" {
  type        = string
  default     = "free"
  description = "Specifies the Semantic Search SKU which should be used for this Search Service."

  validation {
    condition     = contains(["free", "standard"], var.semantic_search_sku)
    error_message = "Possible values include free and standard."
  }
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

variable "hosting_mode" {
  type        = string
  default     = "default"
  description = "Specifies the Hosting Mode, which allows for High Density partitions (that allow for up to 1000 indexes) should be supported."

  validation {
    condition     = contains(["highDensity", "default"], var.hosting_mode)
    error_message = "Possible values are highDensity or default."
  }
}

variable "local_authentication_enabled" {
  type        = bool
  default     = false
  description = "Specifies whether the Search Service allows authenticating using API Keys?"
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "pecifies whether Public Network Access is allowed for this resource."
}

variable "enable_private_endpoint" {
  type        = bool
  default     = true
  description = "Create a private endpoint to resource"
}

variable "dns_resource_group_name" {
  type        = string
  default     = ""
  description = "DNS zone for the private endpoint."
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