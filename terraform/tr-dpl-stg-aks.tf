# Storage Account for Docker Registry
resource "azurerm_storage_account" "azeusstgaccaks1" {
  name                     = "azeusstgaccaks1"
  resource_group_name      = "${azurerm_resource_group.az-eus-rsg-kub.name}"
  location                 = "${azurerm_resource_group.az-eus-rsg-kub.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags {
    Environment = "Development"
  }
  
}

# Storage Account for Prometheus
resource "azurerm_storage_account" "thestgacc" {
  name                     = "thestgacc"
  resource_group_name      = "${azurerm_resource_group.az-eus-rsg-kub.name}"
  location                 = "${azurerm_resource_group.az-eus-rsg-kub.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags {
    Environment = "Development"
  }
}

resource "azurerm_managed_disk" "dsk_prom1" {
  name = "dsk_prom1"
  location = "East US"
  resource_group_name = "${azurerm_resource_group.az-eus-rsg-kub.name}"
  storage_account_type = "Standard_LRS"
  create_option = "Empty"
  disk_size_gb = "10"

  tags {
    environment = "Development"
  }
}
