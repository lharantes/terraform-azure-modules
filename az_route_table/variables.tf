variable "route_table_name" {
  type        = string
  description = "Route table name"
}

variable "rg_location" {
  type        = string
  description = "Route table Resource Group"
}

variable "rg_name" {
  type        = string
  description = "Route table location"
}

variable "routes" {
  type        = map(any)
  description = "Rotes of the Route table"
}

variable "subnet_id" {
  description = "Subnet associated to Route table"
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Character map identifying through `key = value` what the resource tags are."
}