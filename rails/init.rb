if RAILS_ENV.eql? 'test'
  require 'test_help'
  require 'should_b'
  
  ActiveSupport::TestCase.send(:include, ShouldB)
end
