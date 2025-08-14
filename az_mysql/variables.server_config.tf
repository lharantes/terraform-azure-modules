variable "server_configuration" {
  type = map(object({
    name  = string
    value = string
  }))
  description = <<EOT
    (Optional) A configuration block supports the following:
    object({
        name = (Required) Specifies the name of the MySQL Flexible Server Configuration, which needs to be a valid MySQL configuration name. Changing this forces a new resource to be created.
        value = (Required) Specifies the value of the MySQL Flexible Server Configuration. See the MySQL documentation for valid values.
    })
    EOT
  default     = {}
}
