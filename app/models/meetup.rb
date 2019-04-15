class Meetup < ApplicationRecord
  has_many :user_meetups
  belongs_to :campaign
  has_many :characters, through: :campaign
  has_many :users, through: :user_meetups
end
