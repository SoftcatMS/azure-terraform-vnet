resource "azurerm_resource_group" "rg-vnet-test-example" {
  name     = "rg-test-example-resources"
  location = "UK South"
}

module "vnet" {
  source              = "github.com/SoftcatMS/azure-terraform-vnet/?ref=master"
  vnet_name           = "vnet-test-example"
  resource_group_name = azurerm_resource_group.rg-vnet-test-example.name
  address_space       = ["10.2.0.0/16"]
  subnet_prefixes     = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_enforce_private_link_endpoint_network_policies = {
    "subnet1" : true
  }

  subnet_service_endpoints = {
    "subnet1" : ["Microsoft.Sql"],
    "subnet2" : ["Microsoft.Sql"],
    "subnet3" : ["Microsoft.Sql"]
  }

  tags = {
    environment = "test"
    engineer    = "ci/cd"
  }

  depends_on = [azurerm_resource_group.rg-vnet-test-example]
}