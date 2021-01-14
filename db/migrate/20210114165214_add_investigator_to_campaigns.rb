class AddInvestigatorToCampaigns < ActiveRecord::Migration[6.0]
  def change
    add_reference :campaigns, :investigator, null: false, foreign_key: true
  end
end
