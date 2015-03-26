module Duststorm
  class Base
    DEFAULT_FORECAST_URL = 'https://api.forecast.io'

    attr_reader :lat, :lng, :params

    def initialize(lat, lng, options={})
      @lat = lat
      @lng = lng
      @params = options
    end

    def forecast
      if response.success?
        Forecast.new(
          MultiJson.load(response.body, :symbolize_keys => true)
        )
      end
    end

    private

    def response
      @response ||= conn.get(forecast_url, params)
    end

    def conn
      Faraday.new
    end

    def forecast_url
      root_url + forecast_path
    end

    def root_url
      @root_url ||= DEFAULT_FORECAST_URL
    end

    def forecast_path
      "/forecast/#{api_key}/#{lat},#{lng}"
    end

    def api_key
      Duststorm.config.values.first
    end
  end
end
