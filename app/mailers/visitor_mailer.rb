class VisitorMailer < ApplicationMailer
	default from: 'shravankumar.essence@gmail.com'
	
	def welcome_email(visitor)
		@visitor = visitor
		mail(to: @visitor.email, subject: 'Welcome to My Awesome Site')
	end
end
