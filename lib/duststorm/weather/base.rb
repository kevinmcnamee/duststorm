module Duststorm
  module Weather
    class Base
      include Virtus.model

      attribute :summary, String
      attribute :wind_speed, Float
      attribute :precipitation, Float
    end
  end
end
