class ApplicationController < ActionController::Base
  protect_from_forgery
  
private

  # before_filter :authenticate
  def authenticate
    if !current_user
      redirect_to new_session_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end