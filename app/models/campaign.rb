class Campaign < ApplicationRecord
  has_many :meetups
  has_many :characters


  # validates :completed, presence: true
  # validates :title, presence: true
  # validates :expect_number_of_meetups, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  # validates :difficulty, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }
  # validates :max_number_of_characters, numericality: true
  # validates :max_number_of_characters, numericality: { only_integer: true }
  #
  # validate :campaign_character_count
  # validate :has_at_least_one_DM
  # validate :has_at_least_one_character

  def campaign_character_count
    if self.max_number_of_characters
      if self.characters.length < 1
        errors.add(:max_number_of_characters, "You need at least one Dungeon Master and one character!")
      elsif self.characters.length > self.max_number_of_characters
        errors.add(:max_number_of_characters, "Sorry, this campaign is full. Please choose another campaign.")
      end
    end
  end

  def list_of_character_names
    if self.max_number_of_characters
      self.characters.map do |character|
        character.char_name
      end
    end
  end

  def has_at_least_one_DM
    if self.max_number_of_characters
      if !list_of_character_names.include?("Dungeon Master")
        errors.add(:max_number_of_characters, "You need at least one Dungeon Master!")
      end
    end
  end

  def has_at_least_one_character
    if self.max_number_of_characters
      one_char = list_of_character_names.any? do |character_name|
        character_name != "Dungeon Master"
      end
      if !one_char
        errors.add(:max_number_of_characters, "You need at least one character!")
      end
    end
  end

  def completion_meesage
    if self.completed
      "This campaign has either been completed or discontinued. Please choose another campaign."
    else
      "This campaign is currently in progress."
    end
  end

end
