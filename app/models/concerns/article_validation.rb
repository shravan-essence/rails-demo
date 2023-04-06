module ArticleValidation
	extend ActiveSupport::Concern
	included do
		validates :title, presence: true
		validates :body, presence: true, length: {minimum: 10}
	end
end