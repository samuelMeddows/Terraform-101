resource "azurerm_resource_group" "main"  {
    name = "rg-${var.application_name}-${var.environment_name}"
    location = var.primary_location
}


