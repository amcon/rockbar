class AboutController < ApplicationController

	respond_to :html
  
  def index
  	@staffs = Staff.oldest_first
  	@descriptions = Description.all
  end
  
end
