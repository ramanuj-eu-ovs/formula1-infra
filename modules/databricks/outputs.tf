output "id" {
  value = azurerm_databricks_workspace.databricks.id
}

output "workspace_id" {
  value = azurerm_databricks_workspace.databricks.workspace_id
}

output "workspace_url" {
  value = "https://${azurerm_databricks_workspace.databricks.workspace_url}"
}

output "workspace_name" {
  value      = var.databricks_workspace_name
  depends_on = [azurerm_databricks_workspace.databricks]
}
