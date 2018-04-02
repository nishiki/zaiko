require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test 'should not save contact without name' do
    contact = Contact.new
    assert_not contact.save
  end

  test 'save contact without mail and phone' do
    provider = Provider.new(name: 'Poor Company')
    provider.save

    data = {
      name: 'Support',
      provider_id: provider.id
    }
    contact = Contact.new(data)

    assert contact.save
    assert_equal data[:name], contact.name
    assert_nil contact.phone
    assert_nil contact.mail
  end

  test 'should save contact with same name' do
    provider = Provider.new(name: 'Poor Company')
    provider.save

    data = {
      name: 'Support',
      provider_id: provider.id
    }
    assert Contact.new(data).save
    assert Contact.new(data).save
  end

  test 'save contact with mail and phone' do
    provider = Provider.new(name: 'Poor Company')
    provider.save

    data = {
      name: 'Support',
      mail: 'support@poor.paris',
      phone: '+331 39 00 00 00',
      provider_id: provider.id
    }
    contact = Contact.new(data)

    assert contact.save
    assert_equal data[:name], contact.name
    assert_equal data[:mail], contact.mail
    assert_equal data[:phone], contact.phone
  end

  test 'delete all contact if a provider is deleted' do
    provider = Provider.new(name: 'Poor Company')
    provider.save
    provider_id = provider.id

    data = {
      name: 'Support',
      provider_id: provider.id
    }
    assert Contact.new(data).save
    assert Contact.new(data).save
    assert_equal 2, provider.contacts.count
    assert provider.destroy
    assert_equal 0, Contact.where(provider_id: provider_id).count
  end
end
