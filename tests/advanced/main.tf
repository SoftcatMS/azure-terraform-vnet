resource "azurerm_resource_group" "rg-vnet-test-advanced" {
  name     = "rg-test-resources"
  location = "UK South"
}

module "vnet" {
  source              = "../../"
  vnet_name           = "vnet-test-advanced"
  resource_group_name = azurerm_resource_group.rg-vnet-test-advanced.name
  address_space       = ["10.2.0.0/16"]
  subnet_prefixes     = ["10.2.1.0/24", "10.2.2.0/24"]
  subnet_names        = ["subnet1", "subnet2"]

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }

  depends_on = [azurerm_resource_group.rg-vnet-test-advanced]
}