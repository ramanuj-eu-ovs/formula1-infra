output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}
output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}
output "storage_account_blob_endpoint" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
}
output "storage_account_dfs_endpoint" {
  value = azurerm_storage_account.storage_account.primary_dfs_endpoint
}
output "storage_account_primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}
output "storage_account_secondary_access_key" {
  value = azurerm_storage_account.storage_account.secondary_access_key
}
output "storage_account_primary_connection_string" {
  value = azurerm_storage_account.storage_account.primary_connection_string
}
output "adls_file_systems" {
  value = azurerm_storage_data_lake_gen2_filesystem.file_systems
}
output "blob_file_systems" {
  value = azurerm_storage_container.file_systems
}
