class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :destroy]

  def index
    @campaigns = policy_scope(Campaign).order(created_at: :desc)

    @hide_completed = params[:hide_completed] == "true"
    if @hide_completed
      @campaigns = @campaigns.select do |campaign|
        uncompleted_scenarios = campaign.scenarios.reject(&:completed)
        uncompleted_scenarios.any?
      end
    end
  end

  def show
  end

  def new
    @campaign = Campaign.new
    @campaign.investigators.build
    authorize @campaign
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.user = current_user
    authorize @campaign
    # add all necessary scenarios for campaign
    Scenario.scenario_name[@campaign.name.to_sym].each_with_index do |scenario, index|
      @scenario = Scenario.create(
        name: scenario,
        scenario_nr: index + 1,
        completed: false,
        campaign: @campaign
      )
      if !@scenario.save
        render :new
        return
      end
    end

    if @campaign.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_path, notice: 'Campaign was successfully deleted.'
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
    authorize @campaign
  end

  def campaign_params
    params.require(:campaign).permit(:name, :difficulty, :completed, investigators_attributes: [
      :name, :player_name, :deck_link, :physical_trauma, :mental_trauma, :unspent_experience_points
    ])
  end
end
