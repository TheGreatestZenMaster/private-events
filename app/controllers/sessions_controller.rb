class SessionsController < ApplicationController
    
    def new
        @current_user = User.new
    end
    
    def create
        @current_user = User.find_by(name: params[:session][:name])
        cookies[:user_id] = @current_user.id
        flash[:success] = "Logged in!"
        redirect_to user_path(@current_user)
    end
    
    def destroy
       @current_user = nil
       cookies[:user_id] = nil
       flash[:sucess] = "Logged out!"
       redirect_to root_path
    end
    
end
