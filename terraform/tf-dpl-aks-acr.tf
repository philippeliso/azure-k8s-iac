# Azure Container Registry (Docker Registry)
resource "azurerm_container_registry" "registry" {
  name                = "registry"
  resource_group_name = "${azurerm_resource_group.az-eus-rsg-kub.name}"
  location            = "${azurerm_resource_group.az-eus-rsg-kub.location}"
  admin_enabled       = true
  sku                 = "Basic"
  storage_account_id  = "${azurerm_storage_account.azeusstgaccaks1.id}"

  tags {
    Environment = "Development"
  }

}

