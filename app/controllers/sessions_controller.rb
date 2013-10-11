class SessionsController < ApplicationController
  def create
    puts "test"
    puts '*'*200
    if @user = User.authorize(params[:user][:name], params[:user][:password])
      session[:user_id] = @user.id
    else
      flash[:notice] = "Those login credentials are invalid."
    end
    redirect_to root_path
  end

  def new
    @user = User.new
    render 'new.html.erb'
  end

  def destroy
    "Destroy!!!!"
  end
end