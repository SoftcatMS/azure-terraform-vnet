# azure-terraform-vnet

Deploys a Virtual Network in Azure with a subnet or a set of subnets passed in as input parameters

Based of original module: https://github.com/Azure/terraform-azurerm-network

It supports creating:

- Virtual Network (vnet)
- Subnets


## Usage Examples
Review the examples folder: [examples](./examples)


## Deployment
Perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build
- `terraform destroy` to destroy the built infrastructure


< use terraform-docs to create Inputs and Outpus documentation  [terraform-docs](https://github.com/terraform-docs/terraform-docs)

`terraform-docs markdown .`


## Requirements
### Installed Software
The following dependencies must be installed on the development system:

- [Terraform](https://www.terraform.io/downloads.html) 

Azure  
- [Terraform Provider for Azure](https://github.com/hashicorp/terraform-provider-azurerm)
- CLI Tool [az](https://docs.microsoft.com/en-us/cli/azure/)


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_route_table_association.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_route_table_association) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_resource_group.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | The DNS servers to be used with vNet. | `list(string)` | `[]` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | A map of subnet name to Network Security Group IDs | `map(string)` | `{}` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group to be imported. | `string` | n/a | yes |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | A map of subnet name to Route table ids | `map(string)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | A list of public subnets inside the vNet. | `list(string)` | <pre>[<br>  "subnet1",<br>  "subnet2",<br>  "subnet3"<br>]</pre> | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefix to use for the subnet. | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network and subnets. | `map(string)` | <pre>{<br>  "ENV": "test"<br>}</pre> | no |
| <a name="input_vnet_location"></a> [vnet\_location](#input\_vnet\_location) | The location of the vnet to create. Defaults to the location of the resource group. | `string` | `null` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Name of the vnet to create | `string` | `"acctvnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | The address space of the newly created vNet |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | The id of the newly created vNet |
| <a name="output_vnet_location"></a> [vnet\_location](#output\_vnet\_location) | The location of the newly created vNet |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | The Name of the newly created vNet |
| <a name="output_vnet_subnets"></a> [vnet\_subnets](#output\_vnet\_subnets) | The ids of subnets created inside the newl vNet |


## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.
