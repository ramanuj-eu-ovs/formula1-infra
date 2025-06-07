locals {
  azure_base_path      = "/${var.name}/"
  databricks_base_path = "${var.databricks_path}${local.azure_base_path}"

  name_init_script     = "init-script.sh"
  azure_init_path      = "${local.azure_base_path}${local.name_init_script}"
  databricks_init_path = "${local.databricks_base_path}${local.name_init_script}"
}

resource "azurerm_storage_blob" "init_script" {
  source_content = join(
    "\n",
    concat(
      [
        "#!/bin/bash",
        "cp ${local.databricks_base_path}*.jar /databricks/jars"
      ],
      var.extra_commands_init_script
    )
  )

  name                   = local.azure_init_path
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
}

resource "azurerm_storage_blob" "write_jars" {
  for_each = var.jars

  source_uri             = each.value
  name                   = "${local.azure_base_path}${each.key}"
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
}