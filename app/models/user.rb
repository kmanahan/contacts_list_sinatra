class User < ActiveRecord::Base 
  has_many :contacts
  has_secure_password
  validates :username, uniqueness: true, presence: true
end 