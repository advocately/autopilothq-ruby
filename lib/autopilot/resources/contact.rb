module Autopilot
  class Contact < Resource
    self.record_key = :contact
    self.plural_key = :contacts
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve
    include Operations::Identify
    include Operations::TriggerJourney
  end
end
