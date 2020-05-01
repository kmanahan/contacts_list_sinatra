class Contact < ActiveRecord::Base
  belongs_to :user
  validates :username, uniqueness: true, presence: true
end 