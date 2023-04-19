class AuthorWorker
  include Sidekiq::Worker
  sidekiq_option retry: false

  def perform(start_Date, end_date)
    puts "Sidekiq worker creating author from #{start_Date} to #{end_date}"
    # Do something
  end
end