class RemoveInvestigatorFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_reference :campaigns, :investigator, null: false, foreign_key: true
  end
end
