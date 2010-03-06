require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :all
  
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
  
  context "With a user" do
    before { @user = users(:fred) }

    context "editing the user" do
      before { get :edit, :id => @user.to_param }

      should :render => :edit
      assigned(User).should_be { @user }
    end
    
    context "updating the user" do
      before { put :update, :id => @user.to_param, :user => replace_attrib(:name => "demo") }

      should_not :create => User
      assigned(User).name.should_be "demo"
    end
  end
  
  private
    def attrib
      {
        :name => "test"
      }
    end
  
end
