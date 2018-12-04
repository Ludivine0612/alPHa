class Employee < ApplicationRecord
  belongs_to :user
  belongs_to :service
  belongs_to :company

  validates :competence, presence: true
end
