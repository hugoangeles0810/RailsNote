class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  protected
	  def current_user
	  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	  end

	  def authenticate
	  	current_user.is_a? User || access_denied
	  end

	  def access_denied
	  	redirect_to log_in_path, notice: "Please log in to continue"
	  end
end
