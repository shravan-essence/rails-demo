require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Configure 'rails notes' to inspect Cucumber files
  config.annotations.register_directories('features')
  config.annotations.register_extensions('feature') { |tag| /#\s*(#{tag}):?\s*(.*)$/ }

  # config.after_initialize do
  #   Bullet.enable        = true
  #   Bullet.alert         = true
  #   Bullet.bullet_logger = true
  #   Bullet.console       = true
  #   Bullet.rails_logger  = true
  #   Bullet.add_footer    = true
  # end
  config.hosts << "4ebb-2401-4900-1c80-58ed-3b30-56f7-54cf-9346.ngrok-free.app"
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  config.cache_store = :redis_cache_store, { url: 'redis://127.0.0.1:6379/0' }
  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  config.public_file_server.enabled = false
  Rails.application.config.middleware.use ExceptionNotification::Rack,
  email: {
    email_prefix: '[PREFIX] ',
    sender_address: %{"notifier"},
    exception_recipients: %w{chaudharysharwan2000@gmail.com}
  }

  # use :letter_opener below for letter_opener gem
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.perform_deliveries = false
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    domain: 'gmail.com',
    user_name: 'chaudharysharwan2000@gmail.com',
    password: 'gulujnyjxejmvdrc',
    authentication: 'plain',
    enable_starttls_auto: true
  }

  # config.after_initialize do
  #   Bullet.enable = true
  #   Bullet.bullet_logger = true
  #   Bullet.rails_logger = true
  # end
end
