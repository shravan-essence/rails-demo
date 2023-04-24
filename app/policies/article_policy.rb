class ArticlePolicy
  attr_reader :student, :article

  def initialize(current_student, article)
    @student = current_student
    @article = article
  end

  def update?
    student.admin? || !article.published?
  end

  def create?
    student.admin? || student.user?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    student.admin?
  end
end