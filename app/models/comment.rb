class Comment < ApplicationRecord
  include CommentValidation
  belongs_to :article
  delegate :book, to: :article
  has_many :likes
  belongs_to :commentable, polymorphic: true
end
