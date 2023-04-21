class AuthorJob < ApplicationJob
  @queue = :default
  # queue_as :default

  def perform(author)
    # Do something later
    @name = author.name
    @email = author.city
    p 11_111_111_111_111_111_111
    p @name
    p @email
    p 111_111_111_111_111_111_111
    if VisitorMailer.welcome_email(@name, @email).deliver_later
      puts "Mail Sent successfully"
    else
      puts "Mail not sent"
    end
  end
end
