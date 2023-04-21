class VisitorWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'mailers'

  def perform(name, email)
    @name = name
    @email = email
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
