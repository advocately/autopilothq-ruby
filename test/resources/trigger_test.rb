require 'test_helper'

class TriggerTest < Minitest::Test
  include VcrHelper

  def test_all_returns_a_trigger_array
    client = ::Autopilot::Client.new(api_key: 'test')
    response = ::Autopilot::Trigger.all({}, client)
    assert_equal response.first.trigger_id, '0003'
  end
end
