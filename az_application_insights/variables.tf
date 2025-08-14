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

variable "log_analytics_workspace" {
  type        = string
  description = "Specifies the id of a log analytics workspace resource."
}