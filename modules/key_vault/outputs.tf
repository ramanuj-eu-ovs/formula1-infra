output "key_vault_id" {
  value = azurerm_key_vault.key_vault.id

  depends_on = [time_sleep.wait_10_seconds]
}

output "key_vault_uri" {
  value = azurerm_key_vault.key_vault.vault_uri
}
