class UserMeetup < ApplicationRecord
  belongs_to :user
  belongs_to :meetup
  has_many :campaigns, through: :meetups
end
