#################################################################
# ROLE ASSIGNMENTS
#################################################################

variable "role_assignments" {
  type = list(object({
    user_principal_names = optional(list(string), [])
    group_names          = optional(list(string), [])
    sp_names             = optional(list(string), [])
    principal_ids        = optional(list(string), [])
    role_names           = list(string)
    scope                = string
  }))
  description = "The role assignments to create"
}
