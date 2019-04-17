class UserMeetupsController < ApplicationController
  def create
    # byebug
    @rsvp = UserMeetup.new(user_id: session[:user]["id"], meetup_id: flash["user_meetup"]["meetup_id"])
    @rsvp.save
    @campaign = Campaign.find(flash[:meetup]["campaign_id"])
    redirect_to new_character_path
  end

end
