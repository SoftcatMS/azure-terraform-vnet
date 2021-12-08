resource "azurerm_resource_group" "rg-vnet-example" {
  name     = "rg-example-resources"
  location = "UK South"
}

module "vnet" {
  source              = "github.com/SoftcatMS/azure-terraform-vnet/?ref=master"
  vnet_name           = "vnet-example"
  resource_group_name = azurerm_resource_group.rg-vnet-example.name
  address_space       = ["10.1.0.0/16"]
  subnet_prefixes     = ["10.1.1.0/24"]
  subnet_names        = ["subnet1"]

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }

  depends_on = [azurerm_resource_group.rg-vnet-example]
}