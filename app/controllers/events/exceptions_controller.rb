class Events::ExceptionsController < ApplicationController

	before_action :set_event
	
	def create
		@exception = @event.event_exceptions.create(exception_params)
		if @exception.save
			flash[:notice] = "#{@event.title} was deleted successfully!"
			redirect_to events_path
		else
			flash[:alert] = "Unable to delete this date..."
			redirect_to event_path(@event)
		end
	end

	private

	def set_event
		@event = Event.find(params[:event_id])
		
	end

	def exception_params
		params.require(:event_exception).permit(:date)
	end

end