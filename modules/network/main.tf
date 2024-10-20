#main.tf
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  location            = var.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "default"
  resource_group_name = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes    = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "ip" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Standard"
  allocation_method   = "Static"
  domain_name_label   =  var.domain_name
}
