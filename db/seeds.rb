# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.username, email_address: Faker::Internet.email, start_date: Faker::Time.backward(rand(10000..15000), :evening))
end



5.times do
  Campaign.create(completed: false, title: Faker::Lorem.words(2).join(" "), expect_number_of_meetups: rand(1..10), difficulty: rand(1..10), max_number_of_characters: rand(2..7))
end



10.times do
  Meetup.create(campaign_id: rand(Campaign.first.id..Campaign.last.id), location: Faker::Address.street_address, meet_time: Faker::Time.forward(rand(30..60), :evening), number_of_hours: rand(4..10))
end



10.times do
  UserMeetup.create(user_id: rand(User.first.id..User.last.id), meetup_id: rand(Meetup.first.id..Meetup.last.id))
end



50.times do
  Character.create(campaign_id: rand(Campaign.first.id..Campaign.last.id), alignment: ["Lawful Good", "Neutral Good", "Chaotic Good", "Lawful Neutral", "Neutral Neutral", "Chaotic Neutral", "Lawful Evil", "Neutral Evil", "Chaotic Evil"].sample, char_name: Faker::Games::WorldOfWarcraft.hero, klass: ["Bard", "Barbarian", "Cleric", "Druid", "Fighter", "Monk", "Paladin", "Ranger", "Rouge", "Sorcerer", "Warlock", "Wizard"].sample, race: ["Gnome", "Halfling", "Dwarf", "Elf", "Half-Elf", "Teifling", "Human", "Dragonborn", "Half-Orc"].sample, weapon: Faker::Games::Zelda.item, level: rand(1..10), user_id: rand(User.first.id..User.last.id))
end
