require File.dirname(__FILE__) + '/../test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :all
  
  context "a user" do
    before { @user = users(:fred) }

    should("require a name") { @user.should_require_a :name, "can't be blank" }
  end
  
end