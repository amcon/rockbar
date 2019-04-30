class HomeController < ApplicationController

  def index
  	@featured_events = Event.order(date: :asc).order(start_time: :asc).select { |e| e.date >= Date.today }.first(4)
  end

end
