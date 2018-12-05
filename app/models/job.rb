class Job < ApplicationRecord
  belongs_to :employee, class_name: 'User', foreign_key: :user_id
  belongs_to :company
  has_many :skills
  has_many :activities, through: :skills
  has_many :prestations

end
