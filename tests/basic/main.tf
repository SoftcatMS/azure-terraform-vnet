resource "azurerm_resource_group" "rg-vnet-test-basic" {
  name     = "rg-test-resources"
  location = "UK South"
}

module "vnet" {
  source              = "../../"
  vnet_name           = "vnet-test-basic"
  resource_group_name = azurerm_resource_group.rg-vnet-test-basic.name
  address_space       = ["10.1.0.0/16"]
  subnet_prefixes     = ["10.1.1.0/24"]
  subnet_names        = ["subnet1"]

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }

  depends_on = [azurerm_resource_group.rg-vnet-test-basic]
}