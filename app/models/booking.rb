class Booking < ApplicationRecord
  belongs_to :planning
  belongs_to :client

  belongs_to :service
  belongs_to :employee


  validates :start_date, presence: true
  validates :end_date, presence: true
end
