class Article < ApplicationRecord
	include ArticleValidation
	has_many :comments, :dependent => :destroy
	has_many :likes, through: :comments
	has_many :comment, as: :commentable 
	belongs_to :book
	scope :published, ->{where(published: true)}
end
