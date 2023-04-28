require 'rails_helper'

#rspec spec/models/article_spec.rb --format documentation

RSpec.describe Article, type: :model do
	context 'validations' do
		it "ensures that body has 10 or more characters" do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			expect(article).to be_valid
		end
	end

	context 'if gets deleted' do
		it "ensures that it does not get delete article if having a comment" do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: article.id, commentable_type: "Article", commentable_id: article.id)
			del = article.destroy
			expect(del).to be_valid
		end
	end
end
