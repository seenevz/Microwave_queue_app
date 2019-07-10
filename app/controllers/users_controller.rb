class UsersController < ApplicationController
  before_action :user_params, except: [:new, :show]

  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render signup_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user.update(user_params)
    if @user.valid?
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages
      render edit_user_path
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password, :confirm_password)
  end
end
