class RemoveCampaignLogFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :campaign_log, :text
  end
end
