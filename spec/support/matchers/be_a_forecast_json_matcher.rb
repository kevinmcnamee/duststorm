RSpec::Matchers.define :be_a_forecast_json do
  include HaveKeys

  keys = %w[
    latitude
    longitude
    currently
    hourly
    daily
  ]

  match do |actual|
    have_keys_test(actual, keys)
  end

  failure_message do |actual|
    have_keys_failure_message(actual)
  end
end
