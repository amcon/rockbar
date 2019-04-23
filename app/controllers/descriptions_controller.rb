class DescriptionsController < ApplicationController

	before_action :confirm_logged_in, except: [:index]

	respond_to :html

	def index
		@descriptions = Description.all
	end

	def new
		@descriptions = Description.all
		if @descriptions.length == 0
	  	@description = Description.new
	  else
	  	redirect_to(about_path)
	  end
  end

  def create
  	@description = Description.new(description_params)
  	if @description.save
  		flash[:notice] = "About section was successfully added"
  		redirect_to(about_path)
  	else
  		render('new')
  	end
  end

  def edit
  	@description = Description.find(params[:id])
  end

  def update
  	@description = Description.find(params[:id])
  	if @description.update_attributes(description_params)
  		flash[:notice] = "description section was successfully updated"
  		redirect_to(about_path)
  	else
  		render('edit')
  	end
  end

  private

  def description_params
  	params.require(:description).permit(:description)
  end

end
