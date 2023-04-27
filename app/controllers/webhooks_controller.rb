class WebhooksController < ApplicationController

	skip_before_action :verify_authenticity_token

	def webhook
		endpoint_secret = 'whsec_m7kGwhMRv6gf0WHxvbmTzReTjEHVC9Ty'
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
    when 'checkout.session.completed'
      session =  event.data.object

      p 22222222222222222222
      p session.metadata['product_id']
      p 2222222222222222222222222222
      
      @product = Product.find(session.metadata['product_id'])
      @product.update(is_sold: true)
      flash[:alert] = "Congratulations!!! is successfully purchased."
    	
      p 111111111111111
    	p "Completed"
    	p 1111111111111
    else
      puts "Unhandled event type: #{event.type}"
    end
    head 200
	 end
end
