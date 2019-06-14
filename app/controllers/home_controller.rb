class HomeController < ApplicationController

  def index
  	@events = Event.sorted
	@calendar_events = @events.flat_map{ |e| e.calendar_events(params.fetch(:start_date, Time.zone.now).to_date) }
	@sorted_calendar_events = @calendar_events.sort{ |a, b| [a['date'], a['start_time']] <=> [b['date'], b['start_time']] }
	@featured_events = @sorted_calendar_events.select { |e| e.date >= Date.today }.first(4)
  end

end
