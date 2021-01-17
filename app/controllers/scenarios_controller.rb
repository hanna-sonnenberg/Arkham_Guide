class ScenariosController < ApplicationController
  before_action :set_campaign, only: [:index]
  before_action :set_scenarios, only: [:show]

  def index
    @scenarios = Scenario.where(campaign: @campaign)
  end

  def show
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_scenarios
    @scenario = Scenario.find(params[:id])
  end
end
