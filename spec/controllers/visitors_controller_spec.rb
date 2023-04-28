require 'rails_helper'

#rspec spec/controllers/visitors_controller_spec.rb --format documentation

RSpec.describe VisitorsController, type: :controller do
  describe "send_verification_email" do
  	let(:user) { Visitor.create(name:"Shravan", email:"chaudharysharwan2000@gmail.com", username: "Shravank") }
  	let(:mock_mailer) { instance_double(Mail::Message) }

    before do
      allow(VisitorMailer).to receive(:welcome_email).with(user.name, user.email).and_return(mock_mailer)
      allow(mock_mailer).to receive(:deliver)
      p user
    end

    context 'when valid user ID' do
      it { expect(user.email).to match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i) }
    end


    # context "hello" do
		# 	let(:user_id) { user.id }
		# 	let(:user_id) { '132323434' }

		# 	context 'when invalid user ID' do
	  #   	it { expect(user).to be_nil }
	  #   end
   	# end
  end
end