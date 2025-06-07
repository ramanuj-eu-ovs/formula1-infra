output "storage_account_id" {
  value       = module.storage_account.storage_account_id
  description = "Storage account id of the data science workspace."

}

output "key_vault_id" {
  value       = module.key_vault.key_vault_id
  description = "Key vault id of the data science workspace."
}

output "application_insights_id" {
  value       = module.application_insights.application_insights_id
  description = "Application insights id of the data science workspace."
}

output "machine_learning_workspace_id" {
  value       = module.machine_learning_workspace.machine_learning_workspace_id
  description = "Machine learning workspace id of the data science workspace."
}

output "managed_identity" {
  value       = azurerm_user_assigned_identity.managed_identity
  description = "User assigned identity belonging to the data science workspace."
}
