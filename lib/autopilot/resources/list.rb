module Autopilot
  class List < Resource
    self.record_key = :list
    self.plural_key = :lists
    attr_accessor :meta

    include Operations::All
  end
end
