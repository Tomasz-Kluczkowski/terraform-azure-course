// Define provider here
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=1.35.0"
    }
  }
}

// Create a resource group in azure - give it a name "demo", the "demo" will be the terraform name, azure will use
// first-steps-demo as the name for this resource group.
// The location will be taken from vars.tf file.
resource "azurerm_resource_group" "demo" {
  location = var.location
  name = "first-steps-demo"
}