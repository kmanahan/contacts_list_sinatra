class Contact < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true 
  validates :phone, presence: true
  validates :email, presence: true
  validates :address, presence: true
end 
