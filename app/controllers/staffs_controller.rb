class StaffsController < ApplicationController
	before_action :confirm_logged_in, except: [:index]

  respond_to :html

  def index
  	@staffs = Staff.oldest_first
  end

  def new
  	@staff = Staff.new
  end

  def create
  	@staff = Staff.new(staff_params)
  	if @staff.save
  		flash[:notice] = "Staff: '#{@staff.title}' was successfully added"
  		redirect_to(about_path)
  	else
  		render('new')
  	end
  end

  def edit
  	@staff = Staff.find(params[:id])
  end

  def update
  	@staff = Staff.find(params[:id])
  	if @staff.update_attributes(staff_params)
  		flash[:notice] = "Staff: '#{@staff.title}' was successfully updated"
  		redirect_to(about_path)
  	else
  		render('edit')
  	end
  end

  def delete
  	@staff = Staff.find(params[:id])
  end

  def destroy
  	@staff = Staff.find(params[:id])
  	@staff.destroy
		flash[:notice] = "Staff: '#{@staff.title}' was successfully deleted"
		redirect_to(about_path)
  end

  private

  def staff_params
  	params.require(:staff).permit(:title, :staff_image_id, :description)
  end

end
