# Resource-1: Azure Application Gateway Public IP
resource "azurerm_public_ip" "web_ag_publicip" {
  name                = "${local.resource_name_prefix}-web-ag-publicip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"
  #sku = ""  
}

# Azure Application Gateway - Locals Block 
locals {
  # Generic 
  frontend_ip_configuration_name = "${azurerm_virtual_network.vnet.name}-feip"
  redirect_configuration_name    = "${azurerm_virtual_network.vnet.name}-rdrcfg"


  # App1
  backend_address_pool_name_app1      = "${azurerm_virtual_network.vnet.name}-beap-app1"
  http_setting_name_app1              = "${azurerm_virtual_network.vnet.name}-be-htst-app1"
  probe_name_app1                = "${azurerm_virtual_network.vnet.name}-be-probe-app1"

  # HTTP Listener -  Port 80
  listener_name_http                  = "${azurerm_virtual_network.vnet.name}-lstn-http"
  request_routing_rule_name_http      = "${azurerm_virtual_network.vnet.name}-rqrt-http"
  frontend_port_name_http             = "${azurerm_virtual_network.vnet.name}-feport-http"


  # HTTPS Listener -  Port 443
  listener_name_https                  = "${azurerm_virtual_network.vnet.name}-lstn-https"
  request_routing_rule_name_https      = "${azurerm_virtual_network.vnet.name}-rqrt-https"
  frontend_port_name_https             = "${azurerm_virtual_network.vnet.name}-feport-https"
  ssl_certificate_name                 = "my-cert-1" 
}



resource "azurerm_application_gateway" "web_ag" {
  name                = "globant-appgateway"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = azurerm_subnet.agsubnet.id
  }

  frontend_port {
    name = local.frontend_port_name_http
    port = 80
  }
  frontend_port {
    name = local.frontend_port_name_https
    port = 443    
  }  

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.web_ag_publicip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name_app1
  }

  backend_http_settings {
    name                  = local.http_setting_name_app1
    cookie_based_affinity = "Disabled"
    path                  = "/path1/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name_http
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name_http
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name_http
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name_http
    backend_address_pool_name  = local.backend_address_pool_name_app1
    backend_http_settings_name = local.http_setting_name_app1
  }
}