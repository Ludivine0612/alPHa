class Activity < ApplicationRecord
  has_many :skills
  has_many :prestations

  validates :name, presence: true, uniqueness: true
end
