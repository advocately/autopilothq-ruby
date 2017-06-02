module Autopilot
  module Operations
    module TriggerJourney
      def self.included(klass)
        klass.extend(ClassMethods)
      end

      module ClassMethods
        def trigger_journey(contact_or_email, trigger_id, client = Autopilot.shared_client)
          json = client.post_json("/trigger/#{trigger_id}/#{self.record_key}/#{contact_or_email}")
          new(json)
        end
      end
    end
  end
end
