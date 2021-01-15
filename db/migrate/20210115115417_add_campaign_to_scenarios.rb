class AddCampaignToScenarios < ActiveRecord::Migration[6.0]
  def change
    add_reference :scenarios, :campaign, null: false, foreign_key: true
  end
end
