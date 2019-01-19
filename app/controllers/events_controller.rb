class EventsController < ApplicationController

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "#{@event.title} was created successfully!"
			redirect_to(event_path(@event))
		else
			render('new')
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			flash[:notice] = "#{@event.title} was updated successfully!"
			redirect_to(event_path(@event))
		else
			render(event_path(@event))
		end
	end

	def delete
		@event = Event.find(params[:id])
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		flash[:notice] = "#{@event.title} was deleted successfully!"
		redirect_to(events_path)
  end

  private

  def event_params
  	params.require(:event).permit(:title, :profile_image_id, :description, :date, :start_time, :end_time, :hosted_by, :dj, :drink_specials, :cover_charge, :event_type, :event_link)
  end

end
