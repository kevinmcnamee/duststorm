module Duststorm
  module Weather
    class Hourly < Base
      include Virtus.model

      attribute :time, Duststorm::Attribute::Time
      attribute :precipitation, Float
      attribute :temperature, Float

      def initialize(args, &block)
        args[:precipitation] = args[:precipProbability]

        super
      end
    end
  end
end

