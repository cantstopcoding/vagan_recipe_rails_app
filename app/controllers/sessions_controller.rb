class SessionsController < ApplicationController
  def home
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:user][:email])

    # you need to find a user in order to authenticate
    if user && user.authenticate(params[:user][:password])
      # binding.pry
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Wrong Info :( Please Try Again"
      redirect_to login_path
    end
  end
end
