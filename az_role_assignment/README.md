# terraform-role-assignment

## Assign roles to users, groups and service principals

This Terraform module assigns `BUILT IN` roles to users, groups and service principals.

## Usage
NOTE: Assigning the same role to the same user, group or service principal multiple times will merge it, so when you do:
```hcl
module "role_assignments" {
  source = "retoxx-dev/role-assignment/azurerm"

  role_assignments = [
    {
      user_principal_names = ["user1@contoso.com"]
      role_names           = ["Reader", "Web Plan Contributor"]
      scope                = azurerm_resource_group.this.id
    },
    {
      user_principal_names = ["user1@contoso.com", "user2@contoso.com"]
      role_names           = ["Reader", "Owner"]
      scope                = azurerm_resource_group.this.id
    }
  ]
}
```
The role `Reader` will be assigned to `user1@contoso.com` only once.

### Assign roles to users
```hcl
module "role_assignments" {
  source = "retoxx-dev/role-assignment/azurerm"

  role_assignments = [
    {
      user_principal_names = ["user1@contoso.com", "user2@contoso.com"]
      role_names           = ["Reader", "Web Plan Contributor"]
      scope                = azurerm_resource_group.this.id
    }
  ]
}
```

### Assign roles to groups
```hcl
module "role_assignments" {
  source = "retoxx-dev/role-assignment/azurerm"

  role_assignments = [
    {
      group_names = ["group1", "group2", "group3"]
      role_names  = ["Reader", "Web Plan Contributor"]
      scope       = azurerm_resource_group.this.id
    }
  ]
}
```

### Assign roles to service principals
```hcl
module "role_assignments" {
  source = "retoxx-dev/role-assignment/azurerm"

  role_assignments = [
    {
      sp_names   = ["spname1", "spname2", "spname3"]
      role_names = ["Reader", "Web Plan Contributor"]
      scope      = azurerm_resource_group.this.id
    }
  ]
}
```

### Assign roles to service principals but with principal ids
```hcl
module "role_assignments" {
  source = "retoxx-dev/role-assignment/azurerm"

  role_assignments = [
    {
      principal_ids   = ["00000000-0000-0000-0000-000000000000"]
      role_names      = ["Reader", "Web Plan Contributor"]
      scope           = azurerm_resource_group.this.id
    }
  ]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.1 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >=2.37 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.33 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >=2.37 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.33 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.groups](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.principal_ids](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.service_principals](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.users](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azuread_group.group_objects](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_service_principal.sp_objects](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azuread_user.user_objects](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | The role assignments to create | <pre>list(object({<br>    user_principal_names = optional(list(string), [])<br>    group_names          = optional(list(string), [])<br>    sp_names             = optional(list(string), [])<br>    principal_ids        = optional(list(string), [])<br>    role_names           = list(string)<br>    scope                = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->