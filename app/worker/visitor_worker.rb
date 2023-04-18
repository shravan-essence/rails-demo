class VisitorWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(name, email)
    @name = name
    @email = email
    VisitorMailer.welcome_email(@name, @email).deliver_now
  end
end