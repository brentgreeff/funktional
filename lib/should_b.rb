require 'test_help'

require 'should_b/test_instance_methods'
require 'should_b/assertions'
require 'should_b/attribute_test_helper'
require 'should_b/model_assertions'
require 'should_b/integer_extensions'
require 'should_b/setup'

ActiveRecord::Base.send(:include, ShouldB::ModelAssertions)
ActiveSupport::TestCase.send(:include, ShouldB::TestInstanceMethods)
ActiveSupport::TestCase.send(:include, ShouldB::AttributeTestHelper)
ActiveSupport::TestCase.send(:include, ShouldB::Setup)
Integer.send(:include, ShouldB::IntegerExtensions)
