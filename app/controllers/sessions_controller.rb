class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.where(name: params[:name]).first
    #if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_path
  end
end