resource "azapi_resource" "vm_pip" {
  type = "Microsoft.Network/publicIPAddresses@2024-07-01"
  name = "pip-${var.application_name}-${var.environment_name}"
  location = azurerm_resource_group.main.location
  parent_id = azurerm_resource_group.main.id

  body = {
        properties = {
          publicIPAllocationMethod = "static"
          publicIPAddressVersion = "IPv4"
        }
        sku = {
          name = "Standard"
        }
    }
}