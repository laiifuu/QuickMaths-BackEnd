class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :reservations
  has_many :tutors, through: :reservations
  validates :username, length: { in: 6..20 }
  validates :username, uniqueness: true

  def jwt_payload
    super
  end
end
