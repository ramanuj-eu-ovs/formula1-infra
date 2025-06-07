locals {
  config_raw = yamldecode(file(var.roles_config))

  #
  # Flatten the roles configuration such that:
  #
  #  1. We loop through each AD group
  #  2. Loop through each role associated with this AD group (e.g. data_platform_viewer/data_platform_contributor)
  #  3. Loop through each role assignment associated with this role and the module (e.g. data_lake/data_mart)
  #  4. Construct a map of the form:
  #
  # {
  #   "000000.000000.000000.00000YY.Contributor" = {
  #     "aad_group" = "000000.000000.000000.00000YY"
  #     "role_definition" = "Contributor"
  #   }
  # }
  #
  #  So that we can easily loop through this map and assign roles to it.
  #

  module_roles = merge(flatten([
    for group, group_config in local.config_raw.groups : [
      for role in group_config.roles : [
        for role_assignment in try(local.config_raw.roles[role][var.module_name], []) : {
          "${group_config.aad_group}.${role_assignment}" = {
            "aad_group"       = group_config.aad_group
            "role_definition" = role_assignment
          }
        }
      ]
    ]
  ])...)

}

resource "azurerm_role_assignment" "role-assignment" {
  for_each = local.module_roles

  scope                = var.scope
  role_definition_name = each.value.role_definition
  principal_id         = each.value.aad_group
}
