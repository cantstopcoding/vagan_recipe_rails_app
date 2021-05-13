class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    # what is the difference between find and find_by?
    # find_by_id returns nil and find_by returns error
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to "/" if !@user
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :bio, :email, :password)
  end
end
