module Autopilot
  class Contact < Resource
    self.path = "/contact"
    self.record_key = :contact
    attr_accessor :meta

    include Operations::All
    include Operations::Retrieve
    include Operations::Identify
  end
end
