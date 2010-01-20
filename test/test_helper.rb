require 'fileutils'

# Load the environment
ENV['RAILS_ENV'] = 'test'

test_app = File.dirname(__FILE__) + '/test-app'

require "#{test_app}/config/environment.rb"

# Load the testing framework
require 'test_help'
silence_warnings { RAILS_ENV = ENV['RAILS_ENV'] }

# Run the migrations
ActiveRecord::Migration.verbose = false
ActiveRecord::Migrator.migrate("#{RAILS_ROOT}/db/migrate")

# Setup the fixtures path
ActiveSupport::TestCase.fixture_path =
  File.join(File.dirname(__FILE__), "fixtures")

class ActiveSupport::TestCase #:nodoc:
  setup :funktional
  
  self.use_transactional_fixtures = false
  self.use_instantiated_fixtures  = false
end