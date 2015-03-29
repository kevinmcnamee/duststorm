module Duststorm
  module WeatherApi
    class ForecastIo < Base
      def currently_response(response)
        response[:currently]
      end

      def hourly_response(response)
        response[:hourly][:data]
      end

      def daily_response(response)
        response[:daily][:data]
      end

      def precipitation_key
        :precipProbability
      end

      def wind_speed_key
        :windSpeed
      end

      private

      def root_url
        'https://api.forecast.io'
      end

      def forecast_path
        "/forecast/#{api_key}/#{lat},#{lng}"
      end

      def api_key
        Duststorm.config[:forecast_io]
      end
    end
  end
end
