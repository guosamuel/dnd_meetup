class Campaign < ApplicationRecord
  has_many :meetups
  has_many :characters
end
