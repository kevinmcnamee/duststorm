module Duststorm
  module Weather
    class Daily < Base
      attribute :sunrise, Duststorm::Attribute::Time
      attribute :sunset, Duststorm::Attribute::Time
      attribute :low_temperature, Float
      attribute :high_temperature, Float
    end
  end
end

