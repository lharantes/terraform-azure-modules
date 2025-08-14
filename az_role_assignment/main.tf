#################################################################
# ACCESS POLICIES - USERS
#################################################################

data "azuread_user" "user_objects" {
  for_each            = { for policy in toset(local.role_user_combinations) : "${policy.role_name}-${policy.user_principal_name}" => policy if policy.user_principal_name != null }
  user_principal_name = each.value.user_principal_name
}

resource "azurerm_role_assignment" "users" {
  for_each = {
    for combination in toset(local.role_user_combinations) :
    "${combination.role_name}-${combination.user_principal_name}" => {
      role_name           = combination.role_name
      user_principal_name = combination.user_principal_name
      scope               = combination.scope
    } if combination.user_principal_name != null
  }

  scope                = each.value.scope
  principal_id         = data.azuread_user.user_objects["${each.value.role_name}-${each.value.user_principal_name}"].object_id
  role_definition_name = each.value.role_name
}

#################################################################
# ACCESS POLICIES - GROUPS
#################################################################

data "azuread_group" "group_objects" {
  for_each     = { for policy in toset(local.role_group_combinations) : "${policy.role_name}-${policy.group_name}" => policy if policy.group_name != null }
  display_name = each.value.group_name
}

resource "azurerm_role_assignment" "groups" {
  for_each = {
    for combination in toset(local.role_group_combinations) :
    "${combination.role_name}-${combination.group_name}" => {
      role_name  = combination.role_name
      group_name = combination.group_name
      scope      = combination.scope
    } if combination.group_name != null
  }

  scope                = each.value.scope
  principal_id         = data.azuread_group.group_objects["${each.value.role_name}-${each.value.group_name}"].object_id
  role_definition_name = each.value.role_name
}

#################################################################
# ACCESS POLICIES - APPLICATIONS
#################################################################

data "azuread_service_principal" "sp_objects" {
  for_each     = { for policy in toset(local.role_sp_combinations) : "${policy.role_name}-${policy.sp_name}" => policy if policy.sp_name != null }
  display_name = each.value.sp_name
}

resource "azurerm_role_assignment" "service_principals" {
  for_each = {
    for combination in toset(local.role_sp_combinations) :
    "${combination.role_name}-${combination.sp_name}" => {
      role_name = combination.role_name
      sp_name   = combination.sp_name
      scope     = combination.scope
    } if combination.sp_name != null
  }

  scope                = each.value.scope
  principal_id         = data.azuread_service_principal.sp_objects["${each.value.role_name}-${each.value.sp_name}"].object_id
  role_definition_name = each.value.role_name
}

#################################################################
# ACCESS POLICIES - APPLICATIONS
#################################################################

resource "azurerm_role_assignment" "principal_ids" {
  count = length(local.role_principal_id_combinations)

  scope                = local.role_principal_id_combinations[count.index].scope
  principal_id         = local.role_principal_id_combinations[count.index].principal_id
  role_definition_name = local.role_principal_id_combinations[count.index].role_name
}