class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
  queue_as :default

  def perform(*_args)
    # Simulates a long, time-consuming task
    sleep 5
    # Will display current time, milliseconds included
    p "hello from HelloWorldJob #{Time.now.strftime('%F - %H:%M:%S.%L')}"
  end
end
