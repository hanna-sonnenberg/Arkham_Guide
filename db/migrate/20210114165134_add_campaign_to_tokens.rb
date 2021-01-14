class AddCampaignToTokens < ActiveRecord::Migration[6.0]
  def change
    add_reference :tokens, :campaign, null: false, foreign_key: true
  end
end
