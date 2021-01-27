class AddPlayerNameToInvestigators < ActiveRecord::Migration[6.0]
  def change
    add_column :investigators, :player_name, :string
  end
end
