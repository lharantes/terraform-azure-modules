variable "location" {
  type        = string
  description = "Azure region where the resource should be deployed."
  nullable    = false
  default     = "North Europe"
}

variable "region_abbreviations" {
  type        = map(string)
  description = "Map of Azure locations to abbreviations. Recommended to pass from the shared modules/region-abbreviations module."
}

variable "service_prefix" {
  type        = string
  description = "A short name that indicates the purpose of the service."
  nullable    = false
}

variable "environment" {
  type        = string
  description = "A short name that indicates the environment (prd, dev, qua)."
  nullable    = false

  validation {
    condition     = alltrue([contains(["prd", "dev", "qua", "poc"], var.environment)])
    error_message = "Environment name must have one of: 'prd', 'dev', 'qua' or 'poc'."
  }
}

# variable "subscription_id" {}
# variable "tenant_id" {}

