module Duststorm
  module WeatherApi
    DEFAULT_FORECAST_URL = 'https://api.forecast.io'

    def self.response(lat,lng,options)
      WeatherApi::klass.new(lat, lng, options).execute
    end

    def self.klass
      send(Duststorm.config.keys.first)
    end

    private

    def self.forecast_io
      ForecastIo
    end
  end
end

require_relative 'weather_apis/base'
require_relative 'weather_apis/forecast_io'
require_relative 'weather_apis/wunderground'
