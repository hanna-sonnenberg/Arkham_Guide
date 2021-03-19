class ScenariosController < ApplicationController
  before_action :set_campaign, only: [:index, :edit, :update]
  before_action :set_scenarios, only: [:show, :edit, :update] 

  def edit
  end

  def update
    if @scenario.update(scenario_params)
      redirect_to @campaign, notice: 'Scenario was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_scenarios
    @scenario = Scenario.find(params[:id])
    authorize @scenario
  end

  def scenario_params
    params.require(:scenario).permit(:name, :scenario_nr, :completed)
  end
end
