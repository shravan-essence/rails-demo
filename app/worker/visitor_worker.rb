class VisitorWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(name, email)
    @name = name
    @email = email
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