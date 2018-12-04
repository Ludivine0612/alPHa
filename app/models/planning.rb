class Planning < ApplicationRecord
  belongs_to :company

  validates :started, presence: true
  validates :ended, presence: true
end
