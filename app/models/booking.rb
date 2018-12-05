class Booking < ApplicationRecord
  belongs_to :company
  belongs_to :client, class_name: 'User', foreign_key: :user_id
  has_many :prestations
  has_many :activities, through: :prestations

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
end
