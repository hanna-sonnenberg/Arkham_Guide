class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show]

  def index
    @campaigns = Campaign.all
  end

  def show
  end

  def new
    @campaign = Campaign.new
    @campaign.investigators.build
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :difficulty, :campaign_log, :completed, investigators_attributes: [
      :name, :player_name, :deck_link, :physical_trauma, :mental_trauma, :unspent_experience_points
    ])
  end
end
