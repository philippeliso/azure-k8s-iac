resource "azurerm_postgresql_server" "az-eus-db-psql" {
  name                = "az-eus-db-psql1"
  location            = "${azurerm_resource_group.az-eus-rsg-kub.location}"
  resource_group_name = "${azurerm_resource_group.az-eus-rsg-kub.name}"

  sku {
    name     = "GP_Gen5_2" #  {pricing tier}{compute generation}{vCores}
    capacity = 2 # {vCores}
    tier     = "GeneralPurpose" # Pricing Tier
    family   = "Gen5" # {compute generation}

    # name = "PGSQLB50"
    # capacity = 50
    # tier     = "Basic"
  }

  storage_profile {
    storage_mb            = 76800
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = "companyadmin"
  administrator_login_password = "thepasswd"
  version                      = "9.5"

  # storage_mb      = "51200"
  ssl_enforcement = "Disabled"

  tags {
    Environment = "Production"
  }
}

resource "azurerm_postgresql_firewall_rule" "az-brs-nix-deploy1" {
  name                = "az-brs-nix-deploy1"
  resource_group_name = "${azurerm_resource_group.az-eus-rsg-kub.name}"
  server_name         = "${azurerm_postgresql_server.az-eus-db-psql.name}"
  start_ip_address    = "200.200.200.15"
  end_ip_address      = "200.200.200.15"
}

resource "azurerm_postgresql_database" "az-eus-db" {
  name                = "company_lab"
  resource_group_name = "${azurerm_resource_group.az-eus-rsg-kub.name}"
  server_name         = "${azurerm_postgresql_server.az-eus-db-psql.name}"
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
