class VisitorMailer < ApplicationMailer
  default from: 'chaudharysharwan2000@gmail.com'

  def welcome_email(name, email)
    @visitor_name = name
    @visitor_email = email
    mail(to: @visitor_email, subject: 'Welcome to My Awesome Site')
  end

  def deliver_now
    deliver
  end
end