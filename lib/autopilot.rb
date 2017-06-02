require 'net/https'
require 'uri'
require 'cgi'
require 'multi_json'
require 'set'
require 'thread'
require 'date'

require 'autopilot/version'
require 'autopilot/utils'
require 'autopilot/json'

require 'autopilot/enumerable_resource_collection'
require 'autopilot/resource'
require 'autopilot/operations/all'
require 'autopilot/operations/retrieve'
require 'autopilot/operations/identify'
require 'autopilot/operations/trigger_journey'
require 'autopilot/resources/contact'
require 'autopilot/resources/list'
require 'autopilot/resources/trigger'

require 'autopilot/errors'
require 'autopilot/http_response'
require 'autopilot/http_adapter'
require 'autopilot/client'

module Autopilot
  @mutex = Mutex.new

  class << self
    attr_accessor :api_key, :api_base_url, :http_adapter
    attr_writer :shared_client

    def shared_client
      @mutex.synchronize do
        @shared_client ||= Client.new(api_key: api_key, api_base_url: api_base_url, http_adapter: http_adapter)
      end
    end
  end
end
