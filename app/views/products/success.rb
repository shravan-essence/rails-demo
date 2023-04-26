

get '/order/success' do
  session = Stripe::Checkout::Session.retrieve(params[:session_id])
  customer = Stripe::Customer.retrieve(session.customer)

  "<html><body><h1>Thanks for your order, #{customer.name}!</h1></body></html>"
end