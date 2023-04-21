class Author < ApplicationRecord
  has_one_attached :avatar
  extend FriendlyId
  friendly_id :name, use: :slugged
end
