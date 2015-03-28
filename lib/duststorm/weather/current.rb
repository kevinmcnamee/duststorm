module Duststorm
  module Weather
    class Current < Base
      include Virtus.model

      attribute :temperature, Float
    end
  end
end
