require 'rails_helper'
require 'faker'

describe Meetup do
  before do
    @campaign = Campaign.create!(completed: false, title:"The Order of Ogrefist Hills", expect_number_of_meetups: rand(1..10), difficulty: rand(1..10), max_number_of_characters: rand(2..7))
  end
  let(:attributes) do
    {
      campaign_id: @campaign.id,
      location: "The Park",
      meet_time: Faker::Time.forward(rand(30..60), :evening),
      number_of_hours: 4
    }
  end

  it "is considered valid" do
    expect(Meetup.new(attributes)).to be_valid
  end

end
