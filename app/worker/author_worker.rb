class AuthorWorker
  include Sidekiq::Worker

  def perform(start_Date, end_date)
    puts "Sidekiq worker creating author from #{start_Date} to #{end_date}"
    # Do something
  end
end