require 'spec_helper'

module Duststorm
  describe Forecast do
    describe '.new' do
      before do
        allow(Forecast::Base).to receive(:new)
      end

      it 'delegates the call to Base class' do
        expect(Forecast::Base).to receive(:new).with('args')

        Forecast.new('args')
      end
    end
  end
end

