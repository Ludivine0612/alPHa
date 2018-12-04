class Planning < ApplicationRecord
  belongs_to :company, class_name: 'User'

  validates :started, presence: true
  validates :ended, presence: true
end
