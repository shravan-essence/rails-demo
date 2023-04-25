class StripeBillingService
 	DEFAULT_CURRENCY = 'inr'.freeze
	def initialize(params, user)
		@stripe_email = params[:stripeEmail]
		@stripe_token = params[:stripeToken]
		@user = user
	end

	def call
		create_billing(find_customer)
	end

	private 

	attr_accessor :stripe_token, :stripe_email, :user

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
		Stripe::PaymentIntent.create(
			customer: customer.id,
			amount: amount_in_rupees,
			description: "Python Book",
			currency: DEFAULT_CURRENCY
		)
	end

	def amount_in_rupees
		500 * 100
	end

end