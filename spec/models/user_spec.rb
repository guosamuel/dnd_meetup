require 'rails_helper'
require 'date'

describe User do
  let(:attributes) do
    {
      first_name: "Doug",
      last_name: "Jones",
      user_name: "djones",
      email_address: "djones@gmail.com",
      start_date: Time.now.to_datetime,
      password_digest: "asdf123"
    }
  end

  it "is considered valid" do
    expect(User.new(attributes)).to be_valid
  end

end
