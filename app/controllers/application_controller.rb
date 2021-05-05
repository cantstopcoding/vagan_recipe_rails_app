class ApplicationController < ActionController::Base

  # gives access to these methods to the views
  # can also put in application helper but it's going to be mostly use in the controllers so it's appropriate to use in controllers
  helper_method :current_user, :logged_in?

  private # but why private?

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end
end
