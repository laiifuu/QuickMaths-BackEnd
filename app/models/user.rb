class User < ApplicationRecord
  validates :username, length: { in: 6..20 }
end
