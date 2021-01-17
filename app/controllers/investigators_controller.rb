class InvestigatorsController < ApplicationController
  before_action :set_campaign, only: [:index]
  before_action :set_investigator, only: [:show]

  def index
    @investigators = Investigator.where(campaign: @campaign)
  end

  def show
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_investigator
    @investigator = Investigator.find(params[:id])
  end
end
