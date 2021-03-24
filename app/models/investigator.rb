class Investigator < ApplicationRecord
  def self.investigator_name 
    ["Roland Banks",
      "Daisy Walker",
      "\"Skids\" O'Toole",
      "Agnes Baker",
      "Wendy Adams",
      "Zoey Samaras",
      "Rex Murphy",
      "Jenny Barnes",
      "Jim Culver",
      "\"Ashcan\" Pete",
      "Mark Harrigan",
      "Minh Thi Phan",
      "Sefina Rousseau",
      "Akachi Onyele",
      "William Yorick",
      "Lola Hayes",
      "Leo Anderson",
      "Ursula Downs",
      "Finn Edwards",
      "Father Mateo",
      "Calvin Wright",
      "Carolyn Fern",
      "Joe Diamond",
      "Preston Fairmont",
      "Diana Stanley",
      "Rita Young",
      "Marie Lambeau",
      "Tommy Muldoon",
      "Mandy Thompson",
      "Tony Morgan",
      "Luke Robinson",
      "Patrice Hathaway",
      "Sister Mary",
      "Amanda Sharpe",
      "Trish Scarborough",
      "Dexter Drake",
      "Silas Marsh",
      "Nathaniel Cho",
      "Harvey Walters",
      "Winifred Habbamock",
      "Jacqueline Fine",
      "Stella Clark",
      "Norman Withers",
      "Gloria Goldberg"]
  end

  belongs_to :campaign

  validates :name, presence: true, inclusion: { in: Investigator.investigator_name }
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
