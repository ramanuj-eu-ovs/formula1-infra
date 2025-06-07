output "id" {
  value = azurerm_virtual_network.this.id
}

output "subnets" {
  value = { for subnet in keys(var.subnets) : subnet => {
    id     = azurerm_subnet.this[subnet].id,
    name   = azurerm_subnet.this[subnet].name,
    nsg_id = azurerm_subnet_network_security_group_association.this[subnet].id
  } }
}
