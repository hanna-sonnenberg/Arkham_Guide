class InvestigatorsController < ApplicationController
  before_action :set_campaign, only: [:index]

  def index
    @investigators = Investigator.where(campaign: @campaign)
    # @investigators = Investigator.all
  end

  def show
    @investigator = Investigator.find(params[:id])
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end
end
