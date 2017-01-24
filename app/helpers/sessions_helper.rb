module SessionsHelper
    
    def current_user
        if (cookies[:user_id])
            @current_user ||= User.find_by(id: cookies[:user_id])
        end
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def attending(event)
      event.attendees.include?(current_user)
    end
end
