class ScenariosController < ApplicationController
  before_action :set_campaign, only: [:update]
  before_action :set_scenarios, only: [:update]

  def update
    if @scenario.update(scenario_params)
      respond_to do |format|
        format.js  # <-- will render `app/views/scenarios/update.js.erb`
      end
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
