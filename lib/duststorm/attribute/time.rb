module Duststorm
  module Attribute
    class Time < Virtus::Attribute
      def coerce(value)
        return unless value
        ::Time.at(value)
      end
    end
  end
end
