class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
  	true
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    user.present? 
  end

  def new?
  	user.present? 
    create?
  end

  def update?
    user.present? && auth_user?
  end

  def edit?
    update?
  end

  def destroy?
    user.present? 
  end
end
