class AdminUser < ApplicationRecord

	has_secure_password

	validates :email, confirmation: true,
										uniqueness: true

	validate :is_allowed_email

	private
	
	ALLOWED_EMAIL = 'rockbar2nyc@gmail.com, aconklindevelopment@gmail.com'

	def is_allowed_email
		if !ALLOWED_EMAIL.include?(email)
			errors.add(email, "... No other users, except the admin, can create an account")
		end
	end

end
