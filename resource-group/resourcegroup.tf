resource "azurerm_resource_group" "demo" {
  location = var.location
  name = "resource-group-demo"
  tags = {
    env = "resource-group-demo"
  }
}