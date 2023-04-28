require 'rails_helper'

#rspec spec/controllers/articles_controller_spec.rb --format documentation

RSpec.describe ArticlesController, type: :controller do
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
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "hello", body: "Good morning......", book_id: book.id)
			p article.inspect
			get :show, params:{id: article.id}
			expect(response).to render_template(:show)
		end
	end

	describe "patch #update" do
		context "for updating with valid params" do
			before do
		    @user = create(:student)
		    sign_in @user
    	end
    	p @user
			it "if renders update page" do

				book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
				article = Article.create(title: "hello", body: "Good morning......", book_id: book.id)
				p article
				#updated_article = article.update!(title: "This is Shravan")
				p article
				patch :update, params: {id: article.id, article: {title: "This is Shravan"}}
				expect(response).to redirect_to(article_path(article))
				expect(article.reload.title).to eq("This is Shravan")
			end
		end
	end

	describe "request list of all articles" do
		it "should render the show and see if article is present or not" do
	    book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "hello", body: "Good morning......", book_id: book.id)
	    get :show, params:{id: article.id}
	    expect(response).to be_successful
	    p response.body
	    expect(response.body).to include("hello")
	  end
  end
end