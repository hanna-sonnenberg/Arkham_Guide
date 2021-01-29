class Investigator < ApplicationRecord
  belongs_to :campaign

  validates :name, presence: true, inclusion: { in: [
    "Rex Murphy", "Agnes Baker", "Daisy Walker", "William Yorick"
  ] }
  validates :player_name, presence: true
  validates :deck_link, presence: true, format: URI::regexp(%w[http https])
end
