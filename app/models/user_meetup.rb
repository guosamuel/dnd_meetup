class UserMeetup < ApplicationRecord
  belongs_to :user
  belongs_to :meetup
  has_many :campaigns, through: :meetups
  #uniqueness can take "scope" as an arg
  validates :user_id, uniqueness: { scope: :meetup_id }
end
