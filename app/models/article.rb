class Article < ApplicationRecord
	include ArticleValidation
	has_many :comments, :dependent => :destroy
	has_many :likes, through: :comments
	scope :published, ->{where(published: true)}
end
