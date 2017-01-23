class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        @user.save
        redirect_to user_path(@user)
    end
    
    def index
        @current_user = User.find(cookies[:user_id])
        @users = User.all
    end
    
    def show
        @current_user = User.find(cookies[:user_id])
        @user = User.find(params[:id])
    end
    
    private
    
        def user_params
           params.require(:user).permit(:name)
        end
end
