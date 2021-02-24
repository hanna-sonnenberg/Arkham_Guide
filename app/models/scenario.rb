class Scenario < ApplicationRecord
  belongs_to :campaign

  validates :name, presence: true
  validates :scenario_nr, presence: true
end
