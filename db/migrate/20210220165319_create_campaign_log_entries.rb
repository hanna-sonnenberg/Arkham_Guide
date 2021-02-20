class CreateCampaignLogEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :campaign_log_entries do |t|
      t.text :content

      t.timestamps
    end
  end
end
