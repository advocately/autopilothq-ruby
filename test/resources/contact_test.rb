require 'test_helper'

class ContactTest < Minitest::Test
  include VcrHelper

  def test_identify_returns_a_contact_object
    client = ::Autopilot::Client.new(api_key: 'test')
    response = ::Autopilot::Contact.identify({ Email: 'test@example.com' }, client)
    assert_equal "person_39812D93-138C-4B26-B0DF-C9E113D96A5A", response.contact_id
  end


  def test_all_returns_a_contact_array
    client = ::Autopilot::Client.new(api_key: 'test')
    response = ::Autopilot::Contact.all({}, client)
    contact = response.first
    assert_equal Autopilot::Contact, contact.class
    assert_equal "person_0162B5E2-5916-4A1F-AC8B-226D75EC8E71", contact.contact_id
  end


  def test_find_returns_a_contact_object
    client = ::Autopilot::Client.new(api_key: 'test')
    response = ::Autopilot::Contact.retrieve("person_39812D93-138C-4B26-B0DF-C9E113D96A5A", {}, client)
    assert_equal Autopilot::Contact, response.class
    assert_equal "person_39812D93-138C-4B26-B0DF-C9E113D96A5A", response.contact_id
  end
end
