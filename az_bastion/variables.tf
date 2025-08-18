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

variable "subnet_id" {
  type        = string
  description = "Reference to a subnet in which this Bastion Host has been created."
}

variable "sku_bastion" {
  type        = string
  default     = "Standard"
  description = "The SKU of the Bastion Host."

  validation {
    condition     = contains(["Developer", "Basic", "Standard", "Premium"], var.sku_bastion)
    error_message = "Accepted values are Developer, Basic, Standard and Premium."
  }
}

variable "allocation_method" {
  type        = string
  default = "Static"
  description = "The allocation method for this IP address."

  validation {
    condition     = contains(["Static", "Dynamic"], var.allocation_method)
    error_message = "Possible values are Static or Dynamic."
  }
}

variable "sku_public_ip" {
  type        = string
  default     = "Standard"
  description = "The SKU of the Public IP."
}