class Campaign < ApplicationRecord
  belongs_to :user
  has_many :investigators, dependent: :destroy
  has_many :scenarios, dependent: :destroy
  has_many :campaign_log_entries, dependent: :destroy

  accepts_nested_attributes_for :investigators

  validates :name, presence: true, inclusion: { in: [
    "core", "dwl", "ptc", "tfa", "tcu", "tde", "tic"
  ] }
  validates :difficulty, presence: true, inclusion: { in: %w(Easy Standard Hard Nightmare) }
end
