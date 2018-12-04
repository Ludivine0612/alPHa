class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies
  # has_many :clients
  has_many :employees
  has_many :bookings
  has_many :plannings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name, uniqueness: { scope: :last_name }
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :photo_url, presence: true
  validates :role, presence: true
end
