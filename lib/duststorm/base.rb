module Duststorm
  class Base
    attr_reader :lat, :lng, :options

    def initialize(lat, lng, options={})
      @lat = lat
      @lng = lng
      @options = options
    end

    def forecast
      Forecast.new(weather_data)
    end

    private

    def weather_data
      WeatherApi.response(lat,lng,options)
    end
  end
end
