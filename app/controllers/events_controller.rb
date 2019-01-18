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
			redirect_to(event_path(@event))
		else
			render('new')
		end
	end

	def edit
	end

	def update
	end

	def delete
	end

	def destroy
  end

  private

  def event_params
  	params.require(:event).permit(:title, :profile_image_id, :description, :date, :start_time, :end_time, :hosted_by, :dj, :drink_specials, :cover_charge, :event_type, :event_link)
  end

end
