require 'test_help'
require 'funktional/test_instance_methods'

require 'funktional/assertion'
require 'funktional/assigned_assertion'
require 'funktional/email_assertion'
require 'funktional/flashed_assertion'

require 'funktional/model_assertions'

require 'funktional/attribute_test_helper'
require 'funktional/setup'

ActiveRecord::Base.send(:include, Funktional::ModelAssertions)
ActiveSupport::TestCase.send(:include, Funktional::TestInstanceMethods)
ActiveSupport::TestCase.send(:include, Funktional::AttributeTestHelper)
ActiveSupport::TestCase.send(:include, Funktional::Setup)
