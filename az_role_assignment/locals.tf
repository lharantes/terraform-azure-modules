locals {
  role_user_combinations = flatten([
    for policy in var.role_assignments :
    [
      for role_name in policy.role_names :
      [
        for user_principal_name in policy.user_principal_names :
        {
          role_name           = role_name
          user_principal_name = user_principal_name
          scope               = policy.scope
        }
      ]
    ]
  ])

  role_group_combinations = flatten([
    for policy in var.role_assignments :
    [
      for role_name in policy.role_names :
      [
        for group_name in policy.group_names :
        {
          role_name  = role_name
          group_name = group_name
          scope      = policy.scope
        }
      ]
    ]
  ])

  role_sp_combinations = flatten([
    for policy in var.role_assignments :
    [
      for role_name in policy.role_names :
      [
        for sp_name in policy.sp_names :
        {
          role_name = role_name
          sp_name   = sp_name
          scope     = policy.scope
        }
      ]
    ]
  ])

  role_principal_id_combinations = flatten([
    for policy in var.role_assignments :
    [
      for role_name in policy.role_names :
      [
        for principal_id in policy.principal_ids :
        {
          role_name    = role_name
          principal_id = principal_id
          scope        = policy.scope
        }
      ]
    ]
  ])
}