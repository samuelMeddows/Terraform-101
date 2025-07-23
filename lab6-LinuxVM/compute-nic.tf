// Subnet for VM1
data "azurerm_subnet" "bravo" {
  name                 = "snet-bravo"
  virtual_network_name = "vnet-network-dev"
  resource_group_name  = "rg-network-dev"
}

// Virtual network interface card for VM1
resource "azurerm_network_interface" "vm1" {
  name                = "nic-${var.application_name}-${var.environment_name}-vm1"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "public"
    subnet_id                     = data.azurerm_subnet.bravo.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm1.id
  }
}