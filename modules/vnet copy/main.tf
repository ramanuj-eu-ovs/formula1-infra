resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space       = [var.vnet_range]
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet" "this" {
  for_each = var.subnets

  name                 = each.key
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.prefixes
  service_endpoints    = each.value.service_endpoints

  dynamic "delegation" {
    for_each = each.value.delegation == null ? [] : tolist([each.value.delegation])

    content {
      # When a delegation is added through the gui a name is allocated automatically
      # this name seems to take the delelagation name and replace all forward / with
      # '.'. Hence we do the same in terraform to keep consistent.
      name = replace(delegation.value["name"], "/", ".")

      service_delegation {
        name    = delegation.value["name"]
        actions = delegation.value["actions"]
      }
    }
  }
}

resource "azurerm_network_security_group" "this" {
  for_each = var.subnets

  name                = "${var.nsg_name}-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "this" {
  for_each = var.subnets

  subnet_id                 = azurerm_subnet.this[each.key].id
  network_security_group_id = azurerm_network_security_group.this[each.key].id
}
