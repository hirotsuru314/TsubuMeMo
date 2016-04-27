class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 50 }
  has_secure_password
  has_many :posts
end
