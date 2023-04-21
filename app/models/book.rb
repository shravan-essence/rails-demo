class Book < ApplicationRecord
  has_many :authors
  has_many :articles, through: :authors
  has_many :comments, as: :commentable
end
