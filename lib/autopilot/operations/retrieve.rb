module Autopilot
  module Operations
    module Retrieve
      def self.included(klass)
        if klass.singleton_resource?
          klass.extend(Singleton::ClassMethods)
        else
          klass.extend(Pluralton::ClassMethods)
        end
      end

      module Pluralton
        module ClassMethods
          def retrieve(id, opts = {}, client = Autopilot.shared_client)
            opts = Utils.serialize_values(opts)
            json = client.get_json(find_path(id), opts)
            new(json)
          end

          def find_path(id = nil)
            single_path = "/#{record_key.to_s}"
            id ? "#{single_path}/#{id}" : single_path
          end
        end
      end

      module Singleton
        module ClassMethods
          def retrieve(opts = {}, client = Autopilot.shared_client)
            opts = Utils.serialize_values(opts)
            binding.pry
            json = client.get_json(find_path, opts)
            new(json)
          end
        end
      end
    end
  end
end
