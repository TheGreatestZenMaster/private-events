class EventsController < ApplicationController
    before_action :logged_in_user, only: [:new]
    
    def new
        @current_user = current_user
        @event = Event.new()
    end
    
    def create
        @current_user = current_user
        @event = @current_user.created_events.build(event_params)
        @event.save
        @current_user.invitations.build(attended_event_id: @event.id).save
        redirect_to event_path(@event)
    end
    
    def show
        @current_user = current_user
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
