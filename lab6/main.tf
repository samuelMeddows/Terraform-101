resource "azurerm_resource_group" "main"  {
    name = "rg-${var.application_name}-${var.environment_name}"
    location = var.primary_location
}

// Public IP for VM1
resource "azurerm_public_ip" "vm1" {
  name                = "pip-${var.application_name}-${var.environment_name}-vm1"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  allocation_method   = "Static"
}
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

// SSH keys
resource "tls_private_key" "vm1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "private_key" {
  content  = tls_private_key.vm1.private_key_pem
  filename = pathexpand("~/ssh/vm1")   
  file_permission = "0600"
}

resource "local_file" "public_key" {
  content  = tls_private_key.vm1.public_key_openssh
  filename = pathexpand("~/ssh/vm1.pub")
}

// Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm1" {
  name                = "vm1${var.application_name}${var.environment_name}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"

  network_interface_ids = [
    azurerm_network_interface.vm1.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = tls_private_key.vm1.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}