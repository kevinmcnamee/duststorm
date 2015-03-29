require_relative 'duststorm/version'
require_relative 'duststorm/base'
require_relative 'duststorm/utils'
require_relative 'duststorm/attribute'
require_relative 'duststorm/weather'
require_relative 'duststorm/forecast'
require_relative 'duststorm/weather_api'

require 'multi_json'
require 'faraday'

module Duststorm
  # Dustorm.config = { forecast_api: :api_key }
  def self.config=(config)
    @@config = config
  end

  def self.config
    @@config ||= {}
  end

  def self.new(*args)
    Duststorm::Base.new(*args)
  end
end
