class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Execute method in before_action
  before_action :configure_permitted_parameters, if: :devise_controller?
   
  #Substitute array into variable PERMISSIBLE_ATTRIBUTES
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)
  
  protected

  # define method that adds columns tinto strong parameter in devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES) 
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES) 
  end 

end
