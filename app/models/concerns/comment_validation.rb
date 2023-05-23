module CommentValidation
  extend ActiveSupport::Concern
  included do
    validates :commenter, presence: true
    validates :body, presence: true, length: { minimum: 10 }
  end
end