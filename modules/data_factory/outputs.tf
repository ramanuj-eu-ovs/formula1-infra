output "data_factory_id" {
  value = azurerm_data_factory.data_factory_vsts.id
}

output "data_factory_principal_id" {
  value = azurerm_data_factory.data_factory_vsts.identity[0].principal_id
}

output "data_factory_shir_authorization_key" {
  value = azurerm_data_factory_integration_runtime_self_hosted.this.primary_authorization_key
}

output "name" {
  description = "The data factory name"
  value       = azurerm_data_factory.data_factory_vsts.name
}
