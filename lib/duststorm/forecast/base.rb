require 'virtus'

module Duststorm
  module Forecast
    class Base
      include Virtus.model

      attribute :latitude, Attribute::Coordinate
      # attribute :longitude, Attribute::Coordinate
      # attribute :currently, Weather::Current
      # attribute :current, Weather::Current
      # attribute :current, Weather::Current
    end
  end
end
