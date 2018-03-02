class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by(email: params[:session][:email])

    if u && u.authenticate(params[:session][:password])
      # Put on the wristband
      session[:user_id] = u.id
      # flash[:notice] = 'Login Succesful'
      flash[:notice] = "You have successfully login as #{u.email}!"
      redirect_to root_url
    else
      # flash[:error] = 'Email or Password invalid'
      flash[:alert] = "Email or Password invalid!"
      render :new
    end
  end

  def destroy
    # Cut the wristband
    session[:user_id] = nil

    redirect_to root_url
  end

end
