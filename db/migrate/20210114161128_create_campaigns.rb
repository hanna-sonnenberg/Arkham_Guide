class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :difficulty
      t.text :campaign_log
      t.string :scenario
      t.boolean :completed

      t.timestamps
    end
  end
end
