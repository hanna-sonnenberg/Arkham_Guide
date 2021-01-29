class Campaign < ApplicationRecord
  belongs_to :user
  has_many :investigators
  has_many :tokens
  has_many :scenarios

  accepts_nested_attributes_for :investigators

  validates :name, presence: true, inclusion: { in: [
    "core", "dwl", "ptc", "tfa", "tcu", "tde", "tic"
  ] }
  validates :difficulty, presence: true, inclusion: { in: %w(Easy Standard Hard Nightmare) }
end
