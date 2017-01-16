module Autopilot
  module Operations
    module All
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def all(opts = {}, client = Autopilot.shared_client)
          opts = Utils.serialize_values(opts)
          json = client.get_json("/#{plural_key.to_s}", opts)
          EnumerableResourceCollection.new(json[self.plural_key].map { |attributes| new(attributes) })
        end
      end
    end
  end
end
