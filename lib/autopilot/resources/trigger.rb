module Autopilot
  class Trigger < Resource
    self.plural_key = :triggers

    include Operations::All
  end
end
