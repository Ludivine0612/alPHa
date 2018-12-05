class Prestation < ApplicationRecord
  belongs_to :activity
  belongs_to :booking
  belongs_to :job

  validates :description, presence: true
end
