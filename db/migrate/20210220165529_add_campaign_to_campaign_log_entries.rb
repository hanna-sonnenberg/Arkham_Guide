class AddCampaignToCampaignLogEntries < ActiveRecord::Migration[6.0]
  def change
    add_reference :campaign_log_entries, :campaign, null: false, foreign_key: true
  end
end
