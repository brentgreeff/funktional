require 'test_help'
require 'should_b/test_instance_methods'

require 'should_b/assertion'
require 'should_b/assigned_assertion'
require 'should_b/email_assertion'
require 'should_b/flashed_assertion'

require 'should_b/model_assertions'

require 'should_b/attribute_test_helper'
require 'should_b/setup'

ActiveRecord::Base.send(:include, ShouldB::ModelAssertions)
ActiveSupport::TestCase.send(:include, ShouldB::TestInstanceMethods)
ActiveSupport::TestCase.send(:include, ShouldB::AttributeTestHelper)
ActiveSupport::TestCase.send(:include, ShouldB::Setup)
