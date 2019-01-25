module ApplicationHelper

	def error_messages_for(object)
		render(:partial => 'application/error_messages', :locals => {:object => object})
	end

	def logged_in?
		!current_user.nil?
	end

end
