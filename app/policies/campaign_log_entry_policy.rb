class CampaignLogEntryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    user == record.campaign.user
  end

  def update?
    user == record.campaign.user
  end

  def destroy?
    user == record.campaign.user
  end
end
