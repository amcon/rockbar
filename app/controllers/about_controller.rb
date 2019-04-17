class AboutController < ApplicationController

  def index
  	@staffs = Staff.oldest_first
  end
  
end
