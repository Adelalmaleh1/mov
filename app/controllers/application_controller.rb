class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
    
    private
    
     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
     end
     def current_user
      return unless session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  
  
  end
  