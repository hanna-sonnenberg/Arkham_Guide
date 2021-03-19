SCENARIO_NAME = {
  core: ["The Gathering", "The Midnight Masks", "The Devourer Below"],
  dwl: [
    "Extracurricular Activity", "The House Always Wins", "The Miskatonic Museum",
    "The Essex County Express", "Blood on the Altar", "Undimensioned and Unseen",
    "Where Doom Awaits", "Lost in Time and Space"
  ],
  ptc: [
    "Curtain Call", "The Last King", "Echoes of the Past", "The Unspeakable Oath",
    "A Phantom of Truth", "The Pallid Mask", "Black Stars Rise", "Dim Carcosa"
  ],
  tfa: [
    "The Doom of Eztli", "The Untamed Wilds", "Threads of Fate", "The Boundary Beyond",
    "Heart of the Elders", "The City of Archives", "The Depths of Yoth", "Shattered Aeons"
  ],
  tcu: [
    "At Death's Doorstep", "Disappearance at the Twilight Estate", "The Witching Hour",
    "The Secret Name", "The Wages of Sin", "For the Greater Good", "Union and Disillusion",
    "In the Clutches of Chaos", "Before the Black Throne"
  ],
  tde: [
    "Beyond the Gates of Sleep", "Waking Nightmare", "The Search for Kadath",
    "A Thousand Shapes of Horror", "Dark Side of the Moon", "Point of No Return",
    "Where the Gods Dwell", "Weaver of the Cosmos"
  ],
  tic: [
    "The Pit of Despair", "The Vanishing of Elina Harper", "In Too Deep",
    "Devil Reef", "Horror in High Gear", "A Light in the Fog", "The Lair of Dagon",
    "Into the Maelstrom"
  ]
}

CAMPAIGN_NAMES = {
  core: "The Night of Zealot",
  dwl: "The Dunwich Legacy",
  ptc: "The Path to Carcosa",
  tfa: "The Forgotten Age",
  tcu: "The Circle Undone",
  tde: "The Dream Eaters",
  tic: "The Innsmouth Conspiracy"
}

class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :destroy]

  def index
    @campaigns = policy_scope(Campaign).order(created_at: :desc)
    @campaign_names = CAMPAIGN_NAMES
  end

  def show
    @campaign_names = CAMPAIGN_NAMES
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
    SCENARIO_NAME[@campaign.name.to_sym].each_with_index do |scenario, index|
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
