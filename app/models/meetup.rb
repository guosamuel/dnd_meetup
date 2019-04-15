class Meetup < ApplicationRecord
  has_many :user_meetups
  belongs_to :campaign
  has_many :characters, through: :campaign

  validates :campaign_id, presence: true
  validates :location, presence: true
  validates :number_of_hours, numericality: true

  def format_meet_time

  end

  def
end
