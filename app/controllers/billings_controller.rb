require "stripe"
class BillingsController < ApplicationController

	def new
  end
	
	def create

		StripeBillingService.new(billing_params, current_student).call
		redirect_to new_billing_path

  end
    # # Amount in cents
    # @amount = 500

    # customer = Stripe::Customer.create(
    #   :email => params[:stripeEmail],
    #   :source  => params[:stripeToken]
    # )

    # charge = Stripe::PaymentIntent.create(
    #   :customer    => customer.id,
    #   :amount      => @amount,
    #   :description => 'Rails Stripe customer',
    #   :currency    => 'usd'
    # )
  	# rescue Stripe::CardError => e
	  #   flash[:error] = e.message
	  #   redirect_to new_billing_path
    # redirect_to root_path


  private

  def current_user
  	current_student
  end
  
  def billing_params
  	params.permit(:stripeEmail, :stripeToken)
  end

end
