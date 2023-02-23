class Tutor < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :photo_url, presence: true
  validates :description, length: { in: 20..120 }
  validates :hourly_fee, presence: true
  validates :experience, presence: true
end
