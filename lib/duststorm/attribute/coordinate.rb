module Duststorm
  module Attribute
    class Coordinate < Virtus::Attribute
      def coerce(value)
        value.to_f
      end
    end
  end
end
