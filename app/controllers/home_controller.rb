class HomeController < ApplicationController

  def index
  	@featured_events = Event.order(date: :asc).select { |e| e.date >= Date.today }.first(5)
  end

end
