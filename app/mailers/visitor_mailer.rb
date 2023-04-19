class VisitorMailer < ApplicationMailer
	default from: 'chaudharysharwan2000@gmail.com'
	
	def welcome_email(name, email)
		@visitor_name = name
		@visitor_email = email
		p 222222222222222222
		p @visitor_email
		p 2222222222222222222
		mail(to: @visitor_email, subject: 'Welcome to My Awesome Site')
	end
end
