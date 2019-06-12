class EventsController < ApplicationController

	before_action :confirm_logged_in, except: [:index, :show]

	def index
		@events = Event.sorted
		@unordered_calendar_events = @events.flat_map{ |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date) }
		@calendar_events = @unordered_calendar_events.sort{ |a, b| [a['date'], a['start_time']] <=> [b['date'], b['start_time']] }
	end

	def show
		@event = Event.find(params[:id])
		begin
			@date = Date.parse(params[:time])
		rescue
			@date = @event.date
		end
	end

	def new
		@event = Event.new
		@event_types = ["drag", "disco", "fetish", "naked"]
	end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = "#{@event.title} was created successfully!"
			redirect_to(event_path(@event))
		else
			@event_types = ["drag", "disco", "fetish", "naked"]
			render('new')
		end
	end

	def edit
		@event = Event.find(params[:id])
		@event_types = ["drag", "disco", "fetish", "naked"]
	end

	def update
		@event = Event.find(params[:id])
		if @event.update_attributes(event_params)
			flash[:notice] = "#{@event.title} was updated successfully!"
			redirect_to(event_path(@event))
		else
			render('edit')
		end
	end

	def duplicate
	  template = Event.find(params[:id])
	  @event = template.dup # define in Invoice.duplicate how to create a dup
	  render action: 'new'
	end

	def delete
		@event = Event.find(params[:id])
		begin
			@date = Date.parse(params[:time])
		rescue
			@date = @event.date
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		flash[:notice] = "#{@event.title} was deleted successfully!"
		redirect_to(events_path)
  end

  private

  def event_params
  	params.require(:event).permit(:title, :profile_image_id, :description, :date, :start_time, :end_time, :recurring, :end_date, :hosted_by, :dj, :drink_specials, :cover_charge, :event_type, :event_link)
  end

end
