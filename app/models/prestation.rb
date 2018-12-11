class Prestation < ApplicationRecord
  belongs_to :activity
  belongs_to :booking
  belongs_to :job, optional: true

  validates :description, presence: true
end
