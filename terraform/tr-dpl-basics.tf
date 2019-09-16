# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "your-subscrition-id"
  client_id       = "http://your-appid-here"                  # appId
  client_secret   = "your-passaword-here"   # password
  tenant_id       = "your-tenant-id"    # tenant
  # version         = "1.4.0"
  version         = "~>1.5"

# Create a resource group if it doesn’t exist
resource "azurerm_resource_group" "az-eus-rsg-kub" {
  name     = "az-eus-rsg-kub"
  location = "East US"

  tags {
    environment = "Development"
  }
}
