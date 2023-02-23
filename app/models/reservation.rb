class Reservation < ApplicationRecord
  validates :user_id, presence: true
  validates :tutor_id, presence: true
  validates :date, presence: true
  validates :city, presence: true
end
