class Comment < ApplicationRecord
  include CommentValidation
  belongs_to :article
  has_many :likes
end
