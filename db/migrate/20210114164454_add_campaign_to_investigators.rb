class AddCampaignToInvestigators < ActiveRecord::Migration[6.0]
  def change
    add_reference :investigators, :campaign, null: false, foreign_key: true
  end
end
