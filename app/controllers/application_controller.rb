class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    redirect_to user_new_path unless logged_in?
  end

  def logged_in?
    sessions[:user_id] ? true : false
  end
end