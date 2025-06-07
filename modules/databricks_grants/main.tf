locals {
  config_raw = yamldecode(file(var.grants_config))

  #
  # Flatten the roles configuration such that:
  #
  #  1. We loop through each AD group
  #  2. Loop through each role associated with this AD group (e.g. technical_owner/application_owner)
  #  3. Loop through each role assignment associated with this role and the catalog name (e.g. base/staging)
  #  4. Construct a map of the form:
  #
  # {
  #   "000000.000000.000000.00000YY" = ["USE_CATALOG", "..."]
  # }
  #
  #  So that we can easily loop through this map and assign roles to it.
  #

  catalog_grants = merge(flatten([
    for group, group_config in local.config_raw.groups : [
      for role in group_config.roles :
      { (group_config.principal) = local.config_raw.roles[role]["catalog"] } if can(local.config_raw.roles[role]["catalog"])
    ]
  ])...)

  schema_grants = merge([for schema in keys(var.schemas) : {
    (schema) = merge(flatten([
      for group, group_config in local.config_raw.groups : [
        for role in group_config.roles :
        { (group_config.principal) = local.config_raw.roles[role]["schema"][schema] } if can(local.config_raw.roles[role]["schema"][schema])
      ]
    ])...)
  }]...)

  location_grants = merge([for location in keys(var.locations) : {
    (location) = merge(flatten([
      for group, group_config in local.config_raw.groups : [
        for role in group_config.roles :
        { (group_config.principal) = local.config_raw.roles[role]["location"][location] } if can(local.config_raw.roles[role]["location"][location])
      ]
    ])...)
  }]...)
}

resource "databricks_grants" "catalog" {
  count   = length(local.catalog_grants) > 0 ? 1 : 0
  catalog = var.catalog

  dynamic "grant" {
    for_each = local.catalog_grants

    content {
      principal  = grant.key
      privileges = grant.value
    }
  }
}

resource "databricks_grants" "schema" {
  for_each = { for k, v in var.schemas : k => v if length(local.schema_grants[k]) > 0 }
  schema   = each.value

  dynamic "grant" {
    for_each = local.schema_grants[each.key]

    content {
      principal  = grant.key
      privileges = grant.value
    }
  }
}

resource "databricks_grants" "location" {
  for_each          = { for k, v in var.locations : k => v if length(local.location_grants[k]) > 0 }
  external_location = each.value

  dynamic "grant" {
    for_each = local.location_grants[each.key]

    content {
      principal  = grant.key
      privileges = grant.value
    }
  }
}
