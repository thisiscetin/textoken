require 'textoken'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.filter_run :focus => true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end

Dir["./spec/support/**/*.rb"].sort.each { |f| require f}
