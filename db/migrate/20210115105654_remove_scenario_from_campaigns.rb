class RemoveScenarioFromCampaigns < ActiveRecord::Migration[6.0]
  def change
    remove_column :campaigns, :scenario, :string
  end
end
