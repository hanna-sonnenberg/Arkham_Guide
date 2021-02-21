class Investigator < ApplicationRecord
  belongs_to :campaign

  validates :name, presence: true, inclusion: { in: [
    "Rex Murphy", "Agnes Baker", "Daisy Walker", "William Yorick"
  ] }
  validates :player_name, presence: true
  validates :deck_link, presence: true, format: URI::regexp(%w[http https])

  validates :mental_trauma, presence: true
  validates :physical_trauma, presence: true
  validates :unspent_experience_points, presence: true

  after_initialize :init

  def init
    self.mental_trauma ||= 0
    self.physical_trauma ||= 0
    self.unspent_experience_points ||= 0
  end
end
