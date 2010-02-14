Rails.backtrace_cleaner.add_silencer { |line| line =~ /funktional/ }

require 'test_help'

require 'funktional/test_instance_methods'
require 'funktional/test_class_methods'

require 'funktional/assertion'
require 'funktional/assigned_assertion'
require 'funktional/email_assertion'
require 'funktional/flashed_assertion'
require 'funktional/model_assertions'
require 'funktional/route_checker'
require 'funktional/attribute_test_helper'

require 'funktional/context'
require 'funktional/context/stack_recorder'
require 'funktional/context/should_block'
require 'funktional/context/should_not_block'
require 'funktional/context/delegating_should_block'
require 'funktional/context/should_create_block'
require 'funktional/context/should_not_create_block'
require 'funktional/context/should_not_delete_block'
require 'funktional/context/should_not_send_email_block'
require 'funktional/context/should_delete_block'
require 'funktional/context/element_should_block'
require 'funktional/context/count_should_block'
require 'funktional/context/flashed_should_block'
require 'funktional/context/assigned_should_block'
require 'funktional/context/collector'

require 'funktional/setup'

ActiveRecord::Base.send(:include, Funktional::ModelAssertions)

ActiveSupport::TestCase.send(:include, Funktional::TestInstanceMethods)
ActiveSupport::TestCase.send :extend, Funktional::TestClassMethods
ActiveSupport::TestCase.send(:include, Funktional::AttributeTestHelper)

ActiveSupport::TestCase.send(:include, Funktional::Setup)

