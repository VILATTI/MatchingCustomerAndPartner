require 'simplecov'
SimpleCov.start :rails do
  add_filter '/app/models/concerns/'
  add_filter '/spec/'
  add_filter '/config/'
  add_filter '/channels/'

  add_group 'Services', 'app/services'
  add_group 'Serializers', 'app/serializers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib'

  merge_timeout 3600
  minimum_coverage 90
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!
require 'pry-byebug'

Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
ActiveJob::Base.queue_adapter = :test

RSpec.configure do |config|
  config.include ActionDispatch::TestProcess::FixtureFile

  config.fixture_path = ::Rails.root.join('spec/fixtures')

  config.example_status_persistence_file_path = "#{::Rails.root}/spec/examples.txt"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.order = 'random'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.max_formatted_output_length = nil
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
