class InvitationsController < ApplicationController
    
    def create
        @current_user = current_user
        puts params.inspect
        @event = Event.find(params[:invitation][:attended_event_id])
        @current_user.attend!(@event)
        redirect_to @event
    end
    
    
    private
    

end
