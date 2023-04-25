# Rails.configuration.stripe = {
#   publishable_key: Rails.application.secrets.stripe_publishable_key,
#   secret_key: Rails.application.secrets.stripe_secret_key
# }

# Stripe.api_key = Rails.configuration.stripe[:secret_key]

Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_51N0hIlSAGAIftOOZ1fL67leeUH1dZAb3XOTHirbHpH8PlEDURxT2yD7GI6nzo8hqGMPazI3bRu9lsptrAQPe1cpd00VFgTylwQ'],
  :secret_key      => ENV['sk_test_51N0hIlSAGAIftOOZLDhxjvaQbDSaCD9A7rc84gvhQ195UQIWMfkOMwqE0Qftr6IiRRd3PBhFlQUbJI77M8fXJBm700lmsw4ree']
}

Stripe.api_key = 'sk_test_51N0hIlSAGAIftOOZLDhxjvaQbDSaCD9A7rc84gvhQ195UQIWMfkOMwqE0Qftr6IiRRd3PBhFlQUbJI77M8fXJBm700lmsw4ree'