resource "azurerm_resource_group" "demo" {
  location = var.location
  name = "network-security-group-demo"
  tags = {
    env = "network-security-group-demo"
  }
}