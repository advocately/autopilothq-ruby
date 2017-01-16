require 'test_helper'

class ListTest < Minitest::Test
  include VcrHelper

  def test_all_returns_a_list_array
    client = ::Autopilot::Client.new(api_key: 'test')
    response = ::Autopilot::List.all({}, client)
    list = response.first
    assert_equal Autopilot::List, list.class
    assert_equal "contactlist_6F63260C-AA84-450E-942C-0E01A15CFBD1", list.list_id
  end
end
