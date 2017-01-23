class SessionsController < ApplicationController
    
    def new
        @current_user = User.find_by(id: cookies[:user_id])
    end
    
    def create
        @current_user = User.find_by(name: params[:session][:name])
        cookies[:user_id] = @current_user.id
        flash[:success] = "Logged in!"
        redirect_to user_path(@current_user)
    end
    
end
