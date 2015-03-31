# duststorm
[![Gem Version](https://badge.fury.io/rb/duststorm.svg)](http://badge.fury.io/rb/duststorm)
[![Code Climate](https://codeclimate.com/github/kevinmcnamee/duststorm/badges/gpa.svg)](https://codeclimate.com/github/kevinmcnamee/duststorm)
[![Test Coverage](https://codeclimate.com/github/kevinmcnamee/duststorm/badges/coverage.svg)](https://codeclimate.com/github/kevinmcnamee/duststorm)

Receive current, daily, and hourly weather forecasts from multiple APIs.

## Installation

1) Add this line to your application's Gemfile:

    gem 'duststorm'

2) And then execute:

    $ bundle install

3) Create a configuration file in config/duststorm.rb and add the following:

    Duststorm.config = { forecast_io: FORECAST_IO_API_KEY }

_**This gem currently only supports the [ForecastIo api](https://developer.forecast.io/).**_

## Usage

````ruby
require 'duststorm'

duststorm = Duststorm.new(latitude, longitude)

forecast = duststorm.forecast

forecast.currently
forecast.daily
forecast.hourly

puts forecast
````

## Contributing

1. Fork it ( http://github.com/kevinmcnamee/duststorm/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

