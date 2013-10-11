class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(email: params[:email]).first
    #if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path
  end
end