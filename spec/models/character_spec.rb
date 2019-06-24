require 'rails_helper'
require 'faker'

describe Character, type: :model do
  before do
    @campaign = Campaign.create!(completed: false, title:"The Order of Ogrefist Hills", expect_number_of_meetups: rand(1..10), difficulty: rand(1..10), max_number_of_characters: rand(2..7))
    @user_a = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.username, email_address: Faker::Internet.email, start_date: Faker::Time.backward(rand(10000..15000), :evening), password_digest: "asdf123489")
    @user_b = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.username, email_address: Faker::Internet.email, start_date: Faker::Time.backward(rand(10000..15000), :evening), password_digest: "asdf123456")
    Character.create!(campaign_id: @campaign.id, alignment: "Neutral Good", char_name: Faker::Games::WorldOfWarcraft.hero, klass: "Rouge", race: "Gnome", weapon: Faker::Games::Zelda.item, level: rand(1..10), user_id: @user_b.id)
  end
  let(:attributes) do
    {
      campaign_id: @campaign.id,
      alignment: "Lawful Good",
      char_name: "Zumnelisr",
      race: "Half-Elf",
      weapon: "bow and arrow",
      level: 5,
      klass: "Wizard",
      user_id: @user_a.id
    }
  end

  let(:missing_char_name) {attributes.except(:char_name)}

  it "is considered valid" do
    expect(Character.new(attributes)).to be_valid
  end

  it "is invalid without a name" do
    expect(Character.new(missing_char_name)).not_to be_valid
  end

  let(:new_attrs) do {
    campaign_id: @campaign.id,
    alignment: "Neutral Good",
    char_name: "Frodo",
    race: "Halfling",
    weapon: "sword",
    level: 8,
    klass: "Rouge",
    user_id: @user_b.id
  }

  end

  it "is invalid if the user_id is already associated with that campaign" do
    expect(Character.new(new_attrs)).to_not be_valid
  end
end
