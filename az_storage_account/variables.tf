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

variable "account_tier" {
  type        = string
  default     = "Standard"
  description = "Defines the Tier to use for this storage account. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created."
  nullable    = false

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "Invalid value for account tier. Valid options are `Standard` and `Premium`. For `BlockBlobStorage` and `FileStorage` accounts only `Premium` is valid. Changing this forces a new resource to be created."
  }
}

variable "account_replication_type" {
  type        = string
  default     = "LRS"
  description = "Defines the type of replication to use for this storage account. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`.  Defaults to `ZRS`"
  nullable    = false

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.account_replication_type)
    error_message = "Invalid value for replication type. Valid options are `LRS`, `GRS`, `RAGRS`, `ZRS`, `GZRS` and `RAGZRS`."
  }
}

variable "public_network_access_enabled" {
  type        = bool
  default     = false
  description = "Whether the public network access is enabled? Defaults to `true`."
}

variable "account_kind" {
  type        = string
  default     = "StorageV2"
  description = "Defines the Kind of account. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Defaults to `StorageV2`."

  validation {
    condition     = contains(["BlobStorage", "BlockBlobStorage", "FileStorage", "Storage", "StorageV2"], var.account_kind)
    error_message = "Invalid value for account kind. Valid options are `BlobStorage`, `BlockBlobStorage`, `FileStorage`, `Storage` and `StorageV2`. Defaults to `StorageV2`."
  }
}

variable "access_tier" {
  type        = string
  default     = "Hot"
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot, Cool, Cold and Premium. Defaults to Hot."

  validation {
    condition     = contains(["Hot", "Cool", "Premium", "Cold"], var.access_tier)
    error_message = "Invalid value for access tier. Valid options are 'Hot', 'Cool','Premium' or 'Cold'."
  }
}

variable "large_file_share_enabled" {
  type        = bool
  default     = false
  description = "Are Large File Shares Enabled?"
}

variable "is_hns_enabled" {
  type        = bool
  default     = false
  description = "Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2"
}

variable "sftp_enabled" {
  type        = bool
  default     = false
  description = "Enable SFTP for the storage account. SFTP support requires 'is_hns_enabled' set to true"
}

# Private Endpoint 

variable "dns_resource_group_name" {
  type        = string
  default     = null
  description = "Private dns for the private endpoint."
}

variable "subnet_id" {
  type        = string
  default     = null
  description = "Subnet ID for the private endpoint."
}

variable "private_endpoints" {
  type = map(object({
    name                          = optional(string, null)
    subnet_id                     = string
    subresource_name              = string
    private_dns_zone_group_name   = optional(string, "default")
    private_dns_zone_resource_ids = optional(set(string), [])
  }))
  default  = {}
  nullable = false
}