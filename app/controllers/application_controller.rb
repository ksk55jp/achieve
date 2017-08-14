class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Execute method in before_action
  before_action :configure_permitted_parameters, if: :devise_controller?

  #DIVE19_2 : Notification
  before_action :current_notifications, if: :signed_in?
   
  #Substitute array into variable PERMISSIBLE_ATTRIBUTES
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)
  
  protected

  # define method that adds columns tinto strong parameter in devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES) 
    devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES) 
  end 

  # DIVE19_2 : Notification
  def current_notifications
    @notifications_count = Notification.where(user_id: current_user.id).where(read: false).count
  end
end
