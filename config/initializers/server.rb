
require 'json'
require 'sinatra'
require 'stripe'

# The library needs to be configured with your account's secret key.
# Ensure the key is kept out of any version control system you might be using.


# This is your Stripe CLI webhook secret for testing your endpoint locally.
endpoint_secret = 'whsec_d7aa8a0e93cbdb0ababca9f82d3e8596beb35a579113228201d712d65ca3c3c0'



post '/webhook' do
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      status 400
      return
    end

    # Handle the event
    case event.type
    when 'invoice.payment_failed'
      invoice = event.data.object
    when 'invoice.payment_succeeded'
      invoice = event.data.object
    # ... handle other event types
    else
      puts "Unhandled event type: #{event.type}"
    end

    status 200
end