class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    
    if @user.save
      redirect_to users_url
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    @user.update_attributes(params[:user])
    
    redirect_to users_url
  end
  
  def destroy
    @user = User.find(params[:id])
    
    @user.destroy
    redirect_to users_url
  end
end