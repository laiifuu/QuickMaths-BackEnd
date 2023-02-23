class User < ApplicationRecord
  has_many :reservations
  has_many :tutors, through: :reservations
  validates :username, length: { in: 6..20 }
end
