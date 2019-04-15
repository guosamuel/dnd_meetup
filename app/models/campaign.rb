class Campaign < ApplicationRecord
  has_many :meetups
  has_many :characters
  accepts_nested_attributes_for :meetups
end
