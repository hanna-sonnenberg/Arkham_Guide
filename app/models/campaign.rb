class Campaign < ApplicationRecord
  belongs_to :user
  has_many :investigators
  has_many :tokens
  has_many :scenarios

  validates :name, presence: true, inclusion: { in: [
    "The Night of Zealot", "The Dunwich Legacy", "The Path to Carcosa",
    "The Forgotten Age", "The Circle Undone", "The Dream Eaters",
    "The Innsmouth Conspiracy"
  ] }
  validates :difficulty, presence: true, inclusion: { in: %w(Easy Standard Hard Nightmare) }
end
