class InvestigatorsController < ApplicationController
  before_action :set_campaign, only: [:index, :new]
  before_action :set_investigator, only: [:show]

  def index
    @investigators = Investigator.where(campaign: @campaign)
  end

  def show
  end

  def new
    @investigator = Investigator.new
  end

  def create
    @investigator = Investigator.new(investigator_params)
    # we need `campaign_id` to associate investigator with corresponding campaign
    @campaign = Campaign.find(params[:campaign_id])
    @investigator.campaign = @campaign
    if @investigator.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_investigator
    @investigator = Investigator.find(params[:id])
  end

  def investigator_params
    params.require(:investigator).permit(:name, :player_name, :deck_link, :physical_trauma, :mental_trauma, :unspent_experience_points)
  end
end
