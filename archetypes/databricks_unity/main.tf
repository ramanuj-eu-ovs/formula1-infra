locals {
  schemas   = merge([for schema in var.catalog.schemas : { (schema) = "${var.catalog.name}.${schema}" }]...)
  locations = merge([for container in var.storage_account.containers : { (container) = "${container}@${var.storage_account.name}" }]...)
}

module "naming" {
  source = "../../modules/naming"
  prefix = var.naming.prefix
  suffix = var.naming.suffix
}

resource "azurerm_role_assignment" "this" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.databricks_connector.principal_id
}

resource "databricks_storage_credential" "this" {
  name = module.naming.user_assigned_identity.name
  azure_managed_identity {
    access_connector_id = var.databricks_connector.id
  }
  comment = "Managed by TF"

  lifecycle {
    ignore_changes = [
      comment,
    ]
  }
}

resource "databricks_external_location" "this" {
  for_each = var.storage_account.containers

  name = "${each.key}@${var.storage_account.name}"
  url  = "abfss://${each.key}@${var.storage_account.name}.dfs.core.windows.net"

  credential_name = databricks_storage_credential.this.id
  comment         = "Managed by TF"
}

resource "databricks_catalog" "this" {
  name         = var.catalog.name
  storage_root = "abfss://${var.catalog.container}@${var.storage_account.name}.dfs.core.windows.net"

  depends_on = [databricks_external_location.this]
}

resource "databricks_schema" "this" {
  for_each = var.catalog.schemas

  catalog_name = databricks_catalog.this.id
  name         = each.key

  depends_on = [databricks_catalog.this]
}

resource "databricks_volume" "this" {
  for_each = { for volume in var.catalog.volumes : volume.name => volume }

  name             = each.value.name
  catalog_name     = databricks_catalog.this.id
  schema_name      = each.value.schema
  volume_type      = "EXTERNAL"
  storage_location = databricks_external_location.this[each.value.container].url
  comment          = "this volume is managed by terraform"

  depends_on = [databricks_schema.this]
}

module "databricks_grants" {
  source = "../../modules/databricks_grants"
  count  = var.grants_config != null ? 1 : 0

  catalog       = var.catalog.name
  schemas       = local.schemas
  locations     = local.locations
  grants_config = var.grants_config

  depends_on = [databricks_catalog.this, databricks_schema.this]
}
