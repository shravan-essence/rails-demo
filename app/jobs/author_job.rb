class AuthorJob < ApplicationJob
  @queue = :default
  # queue_as :default

  def perform(author)
    # Do something later
    @name = author.name
    @email = author.city
    p 11111111111111111111
    p @name
    p @email
    p 111111111111111111111                   
    if VisitorMailer.welcome_email(@name, @email).deliver_later
      puts "Mail Sent successfully"
    else
      puts "Mail not sent"
    end
  end
end
