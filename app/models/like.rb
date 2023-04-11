class Like < ApplicationRecord
	belongs_to :comment
	belongs_to :article
	delegate :author, to: :article
end
