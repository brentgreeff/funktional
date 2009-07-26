if RAILS_ENV.eql? 'test'
  require 'test_help'
  require File.expand_path(File.dirname(__FILE__) + '/should_b')
  require File.expand_path(File.dirname(__FILE__) + '/should_b/assertions')
  require File.expand_path(File.dirname(__FILE__) + '/should_b/attribute_test_helper')
  require File.expand_path(File.dirname(__FILE__) + '/should_b/model_assertions')
  require File.expand_path(File.dirname(__FILE__) + '/should_b/setup')
  
  ActiveRecord::Base.send(:include, ShouldB::ModelAssertions)
  
  ActiveSupport::TestCase.send(:include, ShouldB)
  ActiveSupport::TestCase.send(:include, ShouldB::AttributeTestHelper)
  ActiveSupport::TestCase.send(:include, ShouldB::Setup)
end
