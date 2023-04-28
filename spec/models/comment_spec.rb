require 'rails_helper'

#rspec spec/models/comment_spec.rb --format documentation

RSpec.describe Comment, type: :model do
	context 'validations' do
		it "ensures that comment body has 10 or more characters" do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: article.id, commentable_type: "Article", commentable_id: article.id)
			expect(comment).to be_valid
		end
	end

	context "if gets updated" do
		it "ensures that if comment will not update if given blank value" do
      book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: article.id, commentable_type: "Article", commentable_id: article.id)
			updated_comment = comment.update(commenter: "Zeel", body:"This is updated by zeel")
			expect(updated_comment).to eq(true)
		end
	end

	context 'when article_id not existing' do
		it "should give invalid error" do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: 12, commentable_type: "Article", commentable_id: article.id)
			expect(comment).to be_invalid
		end
	end

	context 'when article_id existing' do
		it "should give valid " do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: 1, commentable_type: "Article", commentable_id: article.id)
			expect(comment).to be_valid
		end
	end

	context 'when commentable_type not existing' do
		it "should give invalid error" do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: 1, commentable_type: "Author", commentable_id: article.id)
			expect(comment).to be_invalid
		end
	end

	context 'when commentable_type existing' do
		it "should give valid" do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: 1, commentable_type: "Book", commentable_id: article.id)
			expect(comment).to be_valid
		end
	end

	context 'when commentable_id and commentable_type both are from different models' do
		it "should give invalid error" do
			book = Book.create(title: "The Man", body: "Superhero", owner: "Shravan")
			article = Article.create(id:40,title: "Hello" ,body: "wertyuixsdfsfsf",book_id: book.id, published: true)
			comment = Comment.create(commenter: "Shravan", body: "This comment by shravan", article_id: 1, commentable_type: "Book", commentable_id: article.id)
			expect(comment).to be_invalid
		end
	end

end
