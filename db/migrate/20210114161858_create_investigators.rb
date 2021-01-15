class CreateInvestigators < ActiveRecord::Migration[6.0]
  def change
    create_table :investigators do |t|
      t.string :name
      t.string :deck_link
      t.integer :physical_trauma
      t.integer :mental_trauma
      t.integer :unspent_experience_points

      t.timestamps
    end
  end
end
