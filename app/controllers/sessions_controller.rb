class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      redirect_to timers_path
    else
      flash.now[:danger] = "Invalid username/password combination"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
