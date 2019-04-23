class ApplicationController < ActionController::Base

	protect_from_forgery

	helper_method :current_user

	private

	def confirm_logged_in
		unless session[:user_id]
			flash[:notice] = "Please Log In"
			redirect_to(login_path)
		end
	end

	def current_user
		@current_user ||= AdminUser.find(session[:user_id]) if session[:user_id]
	end

end
