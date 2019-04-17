class UserMeetupsController < ApplicationController
  def create
    # byebug
    @rsvp = UserMeetup.new(user_id: current_user.id, meetup_id: flash["user_meetup"]["meetup_id"])
    @rsvp.save
    @campaign = Campaign.find(flash[:meetup]["campaign_id"])
    if @rsvp.valid?
      redirect_to new_character_path
    else
      flash[:errors] = "You already RSVP'd to this meetup!"
      redirect_to meetups_path
    end

  end

end
