require 'test_helper'

class ProvidersControllerTest < ActionDispatch::IntegrationTest
  test 'should not save provider without name' do
    provider = Provider.new
    assert_not provider.save
  end

  test 'save provider without address' do
    data = { name: 'Poor Company' }
    provider = Provider.new(data)

    assert provider.save
    assert_equal data[:name], provider.name
    assert_nil provider.address
  end

  test 'should not save provider with same name' do
    data = { name: 'Poor Company' }

    provider = Provider.new(data)
    assert provider.save

    provider = Provider.new(data)
    assert_not provider.save
  end

  test 'save provider with address' do
    data = {
      name: 'Poor Company',
      address: '1 avenue des Champs Élysées, 75008 Paris'
    }
    provider = Provider.new(data)

    assert provider.save
    assert_equal data[:name], provider.name
    assert_equal data[:address], provider.address
  end
end
