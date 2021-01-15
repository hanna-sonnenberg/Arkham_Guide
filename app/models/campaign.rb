class Campaign < ApplicationRecord
  belongs_to :user
  has_many :investigators
  has_many :tokens
  has_many :scenarios
end
