class ScenariosController < ApplicationController
  before_action :set_campaign, only: [:index]

  def index
    @scenarios = Scenario.where(campaign: @campaign)
  end

  def show
    @scenario = Scenario.find(params[:id])
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
