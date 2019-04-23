class AdminUsersController < ApplicationController

  before_action :confirm_logged_in, only: [:index, :edit, :delete]

  respond_to :html

  def index
  	@admin_users = AdminUser.all
  end

  def new
  	@admin_user = AdminUser.new
  end

  def create
  	@admin_user = AdminUser.new(admin_params)
  	if @admin_user.save
  		session[:user_id] = @admin_user.id
  		flash[:notice] = "Admin account created!"
  		redirect_to(admin_users_path)
  	else
  		render('new')
  	end
  end

  def edit
  	@admin_user = AdminUser.find(params[:id])
  end

  def update
  	@admin_user = AdminUser.find(params[:id])
  	if @admin_user.update_attributes(admin_params)
  		flash[:notice] = "Admin account has been updated successfully"
  		redirect_to(admin_users_path)
  	else
  		render('edit')
  	end
  end

  def delete
  	@admin_user = AdminUser.find(params[:id])
  end

  def destroy
  	@admin_user = AdminUser.find(params[:id])
  	@admin_user.destroy
  	session[:user_id] = nil
  	flash[:notice] = "Admin account: '#{@admin_user.email}' has been destroyed successfully"
  	redirect_to(root_path)
  end

  private

  def admin_params
  	params.require(:admin_user).permit(:email, :password)
  end

end
