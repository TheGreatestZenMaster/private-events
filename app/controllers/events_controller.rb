class EventsController < ApplicationController
    
    def new
        @current_user = current_user
        @event = Event.new()
    end
    
    def create
        @current_user = current_user
        @event = @current_user.events.build(event_params)
        @event.save
        redirect_to events_path
        
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    def index
        @events = Event.all
    end
    
    private
        def event_params
           params.require(:event).permit(:name, :event_date) 
        end
end
