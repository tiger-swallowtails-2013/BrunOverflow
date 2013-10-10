class SessionsController < ApplicationController
  def create
    if @user = User.authorize(params[:name], params[:password])
      session[:user_id] = @user.id
    else
      flash[:notice] = "Those login credentials are invalid."
    end
    redirect_to '/'
  end

  def new
    @user = User.new
    render 'new.html.erb'
  end
end