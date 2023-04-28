require 'rails_helper'

#rspec spec/controllers/authors_controller_spec.rb --format documentation

RSpec.describe AuthorsController, type: :controller do
	describe "GET #index" do
		it "if giving success response" do
			get :index
			expect(response).to be_successful
		end

		it "if renders index page" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe "GET #show" do
		it "if renders show page" do
			author = Author.create(name: "Shravan", city: "Ahmedabad")
			p author.inspect
			get :show, params:{id: author.id}
			expect(response).to render_template(:show)
		end
	end
end