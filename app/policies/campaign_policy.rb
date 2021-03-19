class CampaignPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    user == record.user
  end

  def destroy?
    user == record.user
  end
end
