require 'spec_helper'

module Duststorm
  describe Forecast do
    let(:response_body) do
      {
        latitude: 37.8267,
        longitude: -122.423,
        timezone: "America/Los_Angeles",
        currently: {},
        minutely: {},
        hourly: {},
        daily: {},
        flags: {}
      }
    end

    let(:forecast) { Forecast.new(response_body) }

    describe '#latitude' do
      it 'has a latitude' do
        expect(forecast.latitude).to eq '37.8267'
      end
    end

    describe '#longitude' do
      it 'has a latitude' do
        expect(forecast.longitude).to eq '-122.423'
      end
    end
  end
end
