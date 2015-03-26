module Duststorm
  module Attribute
    class Coordinate < Virtus::Attribute
      def coerce(attr)
        attr.to_f
      end
    end
  end
end
