class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # Returns the current logged-in user (if any).
    def current_user
        if (user_id = cookies[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies[:user_id])
            user = User.find_by(id: user_id)
            log_in(user)
            @current_user = user
        end
    end
    
    def log_in(user)
        cookies[:user_id] = user.id
    end
    
  
  private
  
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  
end
