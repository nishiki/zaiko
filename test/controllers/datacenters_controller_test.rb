require 'test_helper'

class DatacentersControllerTest < ActionDispatch::IntegrationTest
  test 'should not save datacenter without name' do
    datacenter = Datacenter.new
    assert_not datacenter.save
  end

  test 'save datacenter without address' do
    data = { name: 'Ornano' }
    datacenter = Datacenter.new(data)

    assert datacenter.save
    assert_equal data[:name], datacenter.name
  end

  test 'should not save datacenter with same name' do
    data = { name: 'Ornano' }

    datacenter = Datacenter.new(data)
    assert datacenter.save

    datacenter = Datacenter.new(data)
    assert_not datacenter.save
  end
end
