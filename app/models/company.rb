class Company < ApplicationRecord
  belongs_to :boss, class_name: 'User', foreign_key: :user_id
  has_many :jobs
  has_many :bookings

  validates :siret, presence: true, uniqueness: true
  validates :name, presence: true
end
