module Duststorm
  module WeatherApi
    class ForecastIo < Base
      def mapped_response_body
        response = parsed_response_body.dup

        response[:hourly] = response[:hourly][:data]
        response[:daily] = response[:daily][:data]

        response
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
