class User < ApplicationRecord
  has_secure_password
  has_many :user_meetups
  has_many :meetups, through: :user_meetups, dependent: :destroy
  has_many :characters

  #not really on board?
  has_many :campaigns, through: :characters
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :email_address, presence: true, if: :has_at_and_period?
  validates :user_name, uniqueness: { case_sensitive: false }

  # validates :email_address, uniqueness: { case_sensitive: false }                   #uniqueness can take "scope" as an arg

  def has_at_and_period?
    self.email_address.include?("@") && self.email_address.include?(".")
  end

  # def get_all_meetups
  #   self.meetups
  # end

  def full_name
    self.first_name + " " + self.last_name
  end

  #should use start_date = Time.now when creating a new user profile
  def format_start_date
    if self.start_date
      formatted_date = self.start_date.to_date
      year = formatted_date.cwyear
      day = formatted_date.day
      month = month_conversion
      "#{month} #{day}, #{year}"
    end
  end

# Helper method
  def month_conversion
    month_number = self.start_date.to_date.month
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

  #method to get list of characters
  def get_list_of_characters
    # character_list = []
    # Character.all.each do |character|
    #   character.campaign.meetups.each do |meetup|
    #     meetup.users.each do |user|
    #       if user.id == self.id
    #         byebug
    #         character_list << character.char_name
    #       else
    #         puts "I'm here"
    #       end
    #     end
    #   end
    # end
    # character_list.uniq
    self.characters.map do |character|
      character.char_name
    end
  end

  # #method to get list of campaigns_ids
  # def get_list_of_campaign_ids
  #   self.get_all_meetups.map do |meetup|
  #       meetup.campaign_id
  #   end
  # end
  #
  # #methd to get list of campaigns
  # def get_list_of_campaigns
  #   get_list_of_campaign_ids.map do |id|
  #     Campaign.find(id)
  #   end
  # end
  #
  # def get_list_of_campaign_titles
  #   get_list_of_campaigns.map do |campaign|
  #     campaign.title
  #   end
  # end

  def get_list_of_campaign_titles
    # campaign_titles = []
    # Campaign.all.each do |campaign|
    #   campaign.meetups.each do |meetup|
    #     meetup.users.each do |user|
    #       if user.id == self.id
    #         campaign_titles << campaign.title
    #       end
    #     end
    #   end
    # end
    # campaign_titles.uniq
    self.campaigns.map do |campaign|
      campaign.title
    end
  end

end
