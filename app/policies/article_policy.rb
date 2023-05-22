class ArticlePolicy
  attr_reader :student, :article

  def initialize(current_student, article)
    @student = current_student
    @article = article
  end

  def update?
    #student.admin? || !article.published?
    true
  end

  def create?
    true
   # student.admin? || student.user?
  end

  def new?
    create?
  end

  def edit?
    #update?
    true
  end

  def destroy?
    #student.admin?
    true
  end
end