# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :student, :article

  def initialize(current_student, article)
    @student = current_student
    @article = article
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @student.admin?
  end

  def new?
    create?
  end

  def update?
    @student.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @student.admin?
  end

end
