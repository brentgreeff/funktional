require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "Viewing a new user" do
    before { get :new }

    should :render => :new
    should :assign_new => User
  end
  
  context "Creating a user" do
    before { post :create, :user => attrib }
    
    should :create => User
    should :redirect_to => "/users"
  end
  
  private
    def attrib
      {
        :name => "test"
      }
    end
  
end
