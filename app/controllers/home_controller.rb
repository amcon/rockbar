class HomeController < ApplicationController

  respond_to :html
  
  def index
  	@featured_events = Event.order(date: :asc).select { |e| e.date >= Date.today }.first(4)
  end

end
