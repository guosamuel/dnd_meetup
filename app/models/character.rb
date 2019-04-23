class Character < ApplicationRecord
  belongs_to :campaign

  belongs_to :user

  validates :campaign_id, numericality: {greater_than_or_equal_to: 1}
  validates :alignment, presence: true, unless: :dungeon_master?
  validates :char_name, presence: true
  validates :race, presence: true, unless: :dungeon_master?
  validates :klass, presence: true, unless: :dungeon_master?
  validates :user_id, numericality: {greater_than_or_equal_to: 1}, unless: :dungeon_master?
  validates :level, numericality: {greater_than_or_equal_to: 1}, unless: :dungeon_master?

  def dungeon_master?
    char_name == "Dungeon Master"
  end

  def self.alignment_list
    ["Lawful Good", "Neutral Good", "Chaotic Good", "Lawful Neutral", "Neutral Neutral", "Chaotic Neutral", "Lawful Evil", "Neutral Evil", "Chaotic Evil"]
  end

  def self.race_list
    ["Gnome", "Halfling", "Dwarf", "Elf", "Half-Elf", "Teifling", "Human", "Dragonborn", "Half-Orc"]
  end

  def self.klass_list
    ["Bard", "Barbarian", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rouge", "Sorcerer", "Warlock", "Wizard"]
  end
end
