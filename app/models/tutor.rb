class Tutor < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :photo_url, presence: true
  validates :description, length: { in: 20..120 }
  validates :hourly_fee, presence: true
  validates :experience, presence: true
end
