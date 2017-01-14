$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'autopilot'

require 'minitest/autorun'
require 'minitest/around/unit'
require 'vcr'
require 'webmock'
require 'vcr_helper'

VCR.configure do |config|
  config.cassette_library_dir = 'test/cassettes'
  config.hook_into :webmock # or :fakeweb
end
