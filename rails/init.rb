if RAILS_ENV.eql? 'test'
  require 'test_help'
  require 'should_b'
  require 'should_b/assertions'
  require 'should_b/attribute_test_helper'
  
  ActiveSupport::TestCase.send(:include, ShouldB)
  ActiveSupport::TestCase.send(:include, ShouldB::AttributeTestHelper)
end
