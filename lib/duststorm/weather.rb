require 'virtus'

module Duststorm
  module Weather
  end
end

require_relative 'weather/base'
require_relative 'weather/current'
require_relative 'weather/daily'
require_relative 'weather/hourly'
