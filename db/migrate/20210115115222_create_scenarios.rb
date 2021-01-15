class CreateScenarios < ActiveRecord::Migration[6.0]
  def change
    create_table :scenarios do |t|
      t.string :name
      t.integer :scenario_nr
      t.boolean :completed

      t.timestamps
    end
  end
end
