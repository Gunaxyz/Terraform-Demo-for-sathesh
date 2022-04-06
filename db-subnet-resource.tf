resource "azurerm_sql_server" "sql-01" {
  name                         = "sql01globant"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_sql_database" "db-01" {
  name                = "db01globant"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql-01.name

  #   extended_auditing_policy {
  #     storage_endpoint                        = azurerm_storage_account.storage_account.primary_blob_endpoint
  #     storage_account_access_key              = azurerm_storage_account.storage_account.primary_access_key
  #     storage_account_access_key_is_secondary = true
  #     retention_in_days                       = 6
  #   }



  tags = {
    environment = var.environment
  }
}