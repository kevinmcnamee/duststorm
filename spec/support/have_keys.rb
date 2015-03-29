module HaveKeys
  def have_keys_test(actual, keys)
    @missing_keys = keys.flatten.map(&:to_sym) - actual.keys.flatten
    @missing_keys.empty?
  end

  def have_keys_failure_message(actual)
    "expected #{actual} to have keys #{@missing_keys}"
  end
end
