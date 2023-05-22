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
    #@student.admin?
    true
  end

  def new?
    create?
  end

  def update?
    #@student.admin?
    true
  end

  def edit?
    update?
  end

  def destroy?
    #@student.admin?
    true
  end

end
