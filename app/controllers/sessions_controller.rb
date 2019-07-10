class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    byebug
    if @user && @user.authenticate(params[:session][:password])
      byebug
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = "Invalid username/password combination"
      render "new"
    end
  end

  def destroy
    session.destroy(:username)
  end
end
