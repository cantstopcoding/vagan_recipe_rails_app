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

  def google
    @user = User.find_or_create_by(email: auth[:info][:email]) do |user|
      user.first_name = auth[:info][:first_name]
      user.last_name = auth[:info][:last_name]
      user.username = auth[:info][:first_name]
      user.password = SecureRandom.hex
    end
    # why am I seting a password?
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to "/"
    end
  end

  private

  def auth
    request.env["omniauth.auth"]
  end
end
