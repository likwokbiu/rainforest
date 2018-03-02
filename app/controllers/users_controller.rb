class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new

    @user.email    = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "You have successfully signup as  #{@user.email}!"
      # Use _url in controllers
      # Use _path in views
      redirect_to root_url
    else
      render :new
    end
  end

end
