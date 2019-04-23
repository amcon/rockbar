class AboutController < ApplicationController

  def index
  	@staffs = Staff.oldest_first
  	@descriptions = Description.all
  end
  
end
