# copyright: 2018, The Authors

# Test values

resource_group1 = 'rg-test-basic-resources'


describe azure_virtual_network(resource_group: resource_group1, name: 'vnet-test-basic') do
  it { should exist }
  its('location')  { should eq 'uksouth' }
  its('address_space') { should eq ["10.1.0.0/16"] }
  its('subnets') { should eq ["subnet1"] }
end
