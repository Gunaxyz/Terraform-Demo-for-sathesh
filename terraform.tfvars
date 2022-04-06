business_divsion        = "Gunasekhar"
environment             = "Demo"
resource_group_name     = "rg"
resource_group_location = "eastus"
vnet_name               = "vnet"
vnet_address_space      = ["10.1.0.0/16"]

app_subnet_name    = "appsubnet"
app_subnet_address = ["10.1.2.0/24"]

db_subnet_name    = "dbsubnet"
db_subnet_address = ["10.1.3.0/24"]


ag_subnet_name    = "agsubnet"
ag_subnet_address = ["10.1.1.0/24"]

storage_account_name             = "staticwebsite"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"
storage_account_kind             = "StorageV2"
static_website_index_document     = "index.html"
static_website_error_404_document = "error.html"
