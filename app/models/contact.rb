class Contact < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true 
  validates :phone, presence: true
  validates :email, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :address, presence: true
end 
