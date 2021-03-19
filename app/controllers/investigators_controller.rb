class InvestigatorsController < ApplicationController
  before_action :set_campaign, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_investigator, only: [:edit, :update, :destroy]

  def new
    @investigator = Investigator.new
    authorize @investigator
  end

  def create
    @investigator = Investigator.new(investigator_params)
    @investigator.campaign = @campaign
    authorize @investigator
    if @investigator.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @investigator.update(investigator_params)
      redirect_to @campaign, notice: 'Investigator was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @investigator.destroy
    redirect_to @campaign, notice: 'Investigator was successfully deleted.'
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
    authorize @campaign
  end

  def set_investigator
    @investigator = Investigator.find(params[:id])
    authorize @investigator
  end

  def investigator_params
    params.require(:investigator).permit(:name, :player_name, :deck_link, :physical_trauma, :mental_trauma, :unspent_experience_points)
  end
end
