require 'test_helper'

class AutopilotTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Autopilot::VERSION
  end
end
