class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    redirect_to new_user_path unless logged_in?
  end

  def logged_in?
    session[:user_id] ? true : false
  end
end