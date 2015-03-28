require 'virtus'

module Duststorm
  module Forecast
    class Base
      include Virtus.model

      attribute :latitude, Duststorm::Attribute::Coordinate
      attribute :longitude, Duststorm::Attribute::Coordinate
      attribute :currently, Duststorm::Weather::Current
      attribute :daily, [Duststorm::Weather::Daily]
      attribute :hourly, [Duststorm::Weather::Hourly]
    end
  end
end
