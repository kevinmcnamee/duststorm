require 'virtus'

module Duststorm
  module Forecast
    def self.new(*args)
      Forecast::Base.new(*args)
    end
  end
end

require_relative 'forecast/base'
