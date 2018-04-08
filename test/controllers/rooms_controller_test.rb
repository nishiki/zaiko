require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest
  test 'should not save room without name' do
    room = Room.new
    assert_not room.save
  end

  test 'should save room with same name' do
    datacenter = Datacenter.new(name: 'Ornano')
    datacenter.save

    data = {
      name: 'ORN-203',
      datacenter_id: datacenter.id
    }

    assert Room.new(data).save
    assert Room.new(data).save
  end

  test 'delete all room if a datacenter is deleted' do
    datacenter = Datacenter.new(name: 'Ornano')
    datacenter.save
    datacenter_id = datacenter.id

    data = {
      name: 'ORN-203',
      datacenter_id: datacenter.id
    }

    assert Room.new(data).save
    assert Room.new(data).save
    assert_equal 2, datacenter.rooms.count
    assert datacenter.destroy
    assert_equal 0, Room.where(datacenter_id: datacenter_id).count
  end
end
