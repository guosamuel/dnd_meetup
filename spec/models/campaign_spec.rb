require 'rails_helper'

describe Campaign do
  let(:attributes) do
    {
      completed: false,
      title: "The Great Quest",
      expect_number_of_meetups: 10,
      difficulty: 3,
      max_number_of_characters: 8,
    }
  end

  it "is considered valid" do
    expect(Campaign.new(attributes)).to be_valid
  end

end
