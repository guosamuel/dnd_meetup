class Meetup < ApplicationRecord
  has_many :user_meetups
  belongs_to :campaign
  has_many :characters, through: :campaign

  has_many :users, through: :user_meetups

  validates :campaign_id, presence: true
  validates :location, presence: true
  validates :number_of_hours, numericality: true

  validate :within_24_hours

  def within_24_hours
    if self.number_of_hours <= 0 || self.number_of_hours > 24
      errors.add(:number_of_hours, "Hey, there's only 24 hours in a day. Please choose a number between 0 and 24.")
    end
  end

  def format_meet_time
    if self.meet_time
      year = self.meet_time.year
      day = self.meet_time.day
      month = month_conversion
      "#{month} #{day}, #{year} at #{civilian_hour}:#{self.meet_time.min} #{am_or_pm}"
    end
  end

  def civilian_hour
    if self.meet_time.hour == 0
      self.meet_time.hour + 12
    elsif self.meet_time.hour < 12 && self.meet_time.hour > 0
      self.meet_time.hour
    else
      self.meet_time.hour - 12
    end
  end

  def am_or_pm
    if self.meet_time.hour < 12
      "AM"
    else
      "PM"
    end
  end

  def month_conversion
    month_number = self.meet_time.month
    if month_number == 1
      "January"
    elsif month_number == 2
      "February"
    elsif month_number == 3
      "March"
    elsif month_number == 4
      "April"
    elsif month_number == 5
      "May"
    elsif month_number == 6
      "June"
    elsif month_number == 7
      "July"
    elsif month_number == 8
      "August"
    elsif month_number == 9
      "September"
    elsif month_number == 10
      "October"
    elsif month_number == 11
      "November"
    elsif month_number == 12
      "December"
    end
  end


end
