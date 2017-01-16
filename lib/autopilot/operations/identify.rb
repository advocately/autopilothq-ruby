module Autopilot
  module Operations
    module Identify
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def identify(attrs = {}, client = Autopilot.shared_client)
          attrs = Utils.serialize_values(attrs)
          attrs = { self.record_key => attrs }
          json = client.post_json("/#{record_key.to_s}", attrs)
          new(json)
        end
      end
    end
  end
end
