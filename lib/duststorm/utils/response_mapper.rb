module Duststorm
  module Utils
    module ResponseMapper
      def mapped_response_body
        response = parsed_response_body.dup

        response[:currently] = currently_response(response).tap do |currently|
          currently[:summary] = currently[summary_key]
          currently[:temperature] = currently[temperature_key]
          currently[:precipitation] = currently[precipitation_key]
          currently[:wind_speed]  = currently[wind_speed_key]
        end

        response[:hourly] = hourly_response(response).each do |hourly|
          hourly[:time] = hourly[time_key]
          hourly[:summary] = hourly[summary_key]
          hourly[:temperature] = hourly[temperature_key]
          hourly[:precipitation] = hourly[precipitation_key]
          hourly[:wind_speed]  = hourly[wind_speed_key]
        end

        response[:daily] = daily_response(response).each do |daily|
          daily[:time] = daily[time_key]
          daily[:summary] = daily[summary_key]
          daily[:low_temperature] = daily[low_temperature_key]
          daily[:high_temperature] = daily[high_temperature_key]
          daily[:precipitation] = daily[precipitation_key]
          daily[:wind_speed]  = daily[wind_speed_key]
          daily[:sunrise] = daily[sunrise_key]
          daily[:sunset] = daily[sunset_key]
        end

        response
      end

      def time_key
        :time
      end

      def summary_key
        :summary
      end

      def sunrise_key
        :sunrise
      end

      def sunset_key
        :sunset
      end

      def precipitation_key
        :precipitation
      end

      def wind_speed_key
        :wind_speed
      end

      def temperature_key
        :temperature
      end

      def low_temperature_key
        :low_temperature
      end

      def high_temperature_key
        :high_temperature
      end
    end
  end
end
