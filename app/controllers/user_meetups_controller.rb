class UserMeetupsController < ApplicationController
  def create
    # byebug
    @rsvp = UserMeetup.new(user_id: flash["user_meetup"]["user_id"], meetup_id: flash["user_meetup"]["meetup_id"])
    @rsvp.save
    redirect_to meetups_path
  end

  private

  # def user_meetup_params
  #   params.require(:user_meetup).permit(:user_id, :meetup_id)
  # end
end
