resource "azurerm_resource_group" "rg-vnet-example" {
  name     = "rg-example-resources"
  location = "UK South"
}


module "vnet" {
  source = "git@github.com:SoftcatMS/terraform-azure-vnet"

  vnet_name           = "vnet-example"
  resource_group_name = azurerm_resource_group.rg-vnet-example.name
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

  enable_ddos_protection = true

  depends_on = [azurerm_resource_group.rg-vnet-test-advanced]
}
