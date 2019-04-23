require 'rails_helper'

describe UserMeetup, type: :model do
  before do
    @campaign = Campaign.create!(completed: false, title:"The Order of Ogrefist Hills", expect_number_of_meetups: rand(1..10), difficulty: rand(1..10), max_number_of_characters: rand(2..7))
    @user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, user_name: Faker::Internet.username, email_address: Faker::Internet.email, start_date: Faker::Time.backward(rand(10000..15000), :evening), password_digest: "asdf1234")
    @meetup = Meetup.create(campaign_id: @campaign.id, location: "The Park", meet_time: Faker::Time.forward(rand(30..60), :evening), number_of_hours: rand(4..10))
  end
  let(:attributes) do
    {
      user_id: @user.id,
      meetup_id: @campaign.id
    }
  end

  it "is considered valid" do
    expect(UserMeetup.new(attributes)).to be_valid
  end

end
