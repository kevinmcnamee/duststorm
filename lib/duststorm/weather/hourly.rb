module Duststorm
  module Weather
    class Hourly < Base
      attribute :time, Duststorm::Attribute::Time
      attribute :temperature, Float
    end
  end
end

