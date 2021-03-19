class CampaignLogEntriesController < ApplicationController
  before_action :set_campaign, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_campaign_log_entry, only: [:edit, :update, :destroy]

  def new
    @campaign_log_entry = CampaignLogEntry.new
    authorize @campaign_log_entry
  end

  def create
    @campaign_log_entry = CampaignLogEntry.new(campaign_log_entry_params)
    @campaign_log_entry.campaign = @campaign
    authorize @campaign_log_entry
    if @campaign_log_entry.save
      redirect_to campaign_path(@campaign)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @campaign_log_entry.update(campaign_log_entry_params)
      redirect_to @campaign, notice: 'Campaign log entry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @campaign_log_entry.destroy
    redirect_to @campaign, notice: 'Campaign log entry was successfully deleted.'
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def set_campaign_log_entry
    @campaign_log_entry = CampaignLogEntry.find(params[:id])
    authorize @campaign_log_entry
  end

  def campaign_log_entry_params
    params.require(:campaign_log_entry).permit(:content)
  end
end
