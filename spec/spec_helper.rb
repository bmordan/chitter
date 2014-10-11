ENV["RACK_ENV"] = "test"

require_relative '../app/main'
require 'features/_signup'
require 'capybara/rspec'
require 'database_cleaner'

Capybara.app = Sinatra::Application.new

RSpec.configure do |config|

  include SignUp

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end 

end