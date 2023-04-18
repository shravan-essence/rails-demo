class VisitorMailer < ApplicationMailer
	default from: 'shravankumar.essence@gmail.com'
	
	def welcome_email(name, email)
		@visitor_name = name
		@visitor_email = email
		mail(to: @visitor_email, subject: 'Welcome to My Awesome Site')
	end
end
