# copyright: 2018, The Authors

# Test values

resource_group1 = 'demo-resources'


## Resource Groups
control 'Resource Group Tests' do
  describe azurerm_resource_groups.where(name: resource_group1) do
    it               { should exist }
  end
end

describe azure_webapp(resource_group: resource_group1, name: 'softcat-demo-webapp') do
  it { should exist }
end