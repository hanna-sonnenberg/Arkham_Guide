class Campaign < ApplicationRecord
  def self.difficulties
    ['Easy', 'Standard', 'Hard', 'Nightmare']
  end

  def self.identifiers
    ["core", "dwl", "ptc", "tfa", "tcu", "tde", "tic"]
  end

  def self.names
    {
      core: "The Night of Zealot",
      dwl: "The Dunwich Legacy",
      ptc: "The Path to Carcosa",
      tfa: "The Forgotten Age",
      tcu: "The Circle Undone",
      tde: "The Dream Eaters",
      tic: "The Innsmouth Conspiracy"
    }
  end

  belongs_to :user
  has_many :investigators, dependent: :destroy
  has_many :scenarios, dependent: :destroy
  has_many :campaign_log_entries, dependent: :destroy

  accepts_nested_attributes_for :investigators

  validates :name, presence: true, inclusion: { in: Campaign.identifiers }
  validates :difficulty, presence: true, inclusion: { in: Campaign.difficulties }
end
