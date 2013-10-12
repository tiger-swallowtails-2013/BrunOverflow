class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end
end