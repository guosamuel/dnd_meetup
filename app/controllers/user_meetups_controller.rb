class UserMeetupsController < ApplicationController
  def create
    # byebug
    @rsvp = UserMeetup.new(user_id: session[:user]["id"], meetup_id: flash["user_meetup"]["meetup_id"])
    @rsvp.save
    redirect_to new_character_path
  end

end
