require 'test_helper'

class ContactTest < Minitest::Test
  include VcrHelper

  def test_identify_returns_a_contact_object
    client = ::Autopilot::Client.new(api_key: '7ed573a1f01643d6b3f5c15fc3b927cc')
    response = ::Autopilot::Contact.identify({ Email: 'test@example.com' }, client)
    assert_equal "person_39812D93-138C-4B26-B0DF-C9E113D96A5A", response.contact_id
  end
end
