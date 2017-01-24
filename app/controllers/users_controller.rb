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
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        @future_events = @user.attended_events.future_events
        @past_events = @user.attended_events.past_events
    end
    
    private
    
        def user_params
           params.require(:user).permit(:name)
        end
end
