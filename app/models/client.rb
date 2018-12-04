class Client < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :house_name, presence: true, uniqueness: true
end
