class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :authorized?

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      User.new
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized?
    if !logged_in
      flash[:authozired] = "You are not logged in"
    end
  end
end
