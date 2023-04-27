class StripeBillingService
 	DEFAULT_CURRENCY = 'inr'.freeze
	def initialize(params, user, image)
		@user = user
		@product = params
		@image = image
	end

	def call
		create_billing(find_customer)
	end

	private 

	attr_accessor :user, :product, :image

	def find_customer
		if user.stripe_token
    	retrieve_customer(user.stripe_token)
  	else
  		create_customer
  	end
	end

	def retrieve_customer(stripe_token)
    Stripe::Customer.retrieve(stripe_token) 
  end

	def create_customer
		customer = Stripe::Customer.create(email: user.email, source: stripe_token)
		user.update(stripe_token: customer.id)
		customer
	end

	#4242 4242 4242 4242 card number for testing and CVV is 123

	def create_billing(customer)
		Stripe::Checkout::Session.create({
			customer: customer,
			"allow_promotion_codes": true,
	    line_items: [{
	      price_data: {
	        currency: 'inr',
	        product_data: {
	        	name: product.name,
	          description: product.description,
	          images: [image]
	        },
	        unit_amount: product.price * 100,
	      },
	      quantity: 1,
	    }],
	    metadata: {product_id: product.id},
	    mode: 'payment',
	    payment_method_types: ['card'],
	    # These placeholder URLs will be replaced in a following step.
	    success_url: "https://4ebb-2401-4900-1c80-58ed-3b30-56f7-54cf-9346.ngrok-free.app/products",
	    cancel_url: "https://4ebb-2401-4900-1c80-58ed-3b30-56f7-54cf-9346.ngrok-free.app/products",
  	})
	end

	def amount_in_rupees
		500 * 100
	end

end