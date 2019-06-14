class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # helper_method :current_user #This is for Facebook log in

  protected

  # def current_user   #This is for Facebook log in
  #   @current_user = User.find(session[:user_id]) if session[:user_id] 
  # end

  def configure_permitted_parameters   #This is for Devise log in
      devise_parameter_sanitizer.for(:sign_up) << :username
      devise_parameter_sanitizer.for(:account_update) << :username
  end

end
