require 'spec_helper'

module Duststorm
  module Forecast
    describe Base do
      let(:response_body) do
        {
          latitude: 37.8267,
          longitude: -122.423,
          timezone: "America/Los_Angeles",
          currently: {},
          hourly: [{}],
          daily: [{}],
        }
      end

      let(:forecast) { Forecast::Base.new(response_body) }

      describe '#latitude' do
        it 'has a latitude' do
          expect(forecast.latitude).to eq 37.8267
        end
      end

      describe '#longitude' do
        it 'has a longitude' do
          expect(forecast.longitude).to eq -122.423
        end
      end

      describe '#currently' do
        it 'is a Current Weather object' do
          expect(forecast.currently).to be_a(Weather::Current)
        end
      end

      describe '#daily' do
        it 'is a Daily Weather object' do
          expect(forecast.daily.first).to be_a(Weather::Daily)
        end
      end

      describe '#hourly' do
        it 'is an Hourly Weather object' do
          expect(forecast.hourly.first).to be_a(Weather::Hourly)
        end
      end
    end
  end
end
