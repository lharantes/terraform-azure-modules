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

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to add to resources."
}

variable "vnet_address_prefix" {
  type        = string
  description = "Virtual Network address prefix"
}

variable "dns_servers" {
  type        = list(string)
  description = "Virtual Network DNS Server"
  default     = []
}

# Subnets
variable "subnet" {
  type = map(object({
    address_prefixes  = string
    name              = optional(string, null)
    service_endpoints = optional(list(string), null)
  }))
  description = "A map of subnets for Virtual Network"
}