module Duststorm
  module WeatherApi
    class Base
      attr_reader :lat, :lng, :options

      def initialize(lat, lng, options={})
        @lat = lat
        @lng = lng
        @options = options
      end

      def execute
        if response.success?
          mapped_response_body
        end
      end

      def response
        @response ||= conn.get(forecast_url, options)
      end

      def conn
        Faraday.new
      end

      def forecast_url
        root_url + forecast_path
      end

      private

      def mapped_response_body
        parsed_response_body
      end

      def parsed_response_body
        MultiJson.load(response.body, :symbolize_keys => true)
      end
    end
  end
end
