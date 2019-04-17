class MeetupsController < ApplicationController
  before_action :find_meetup, only: [:show, :edit, :update, :destroy]

  def index
    # @meetups = Meetup.all
    @meetups = Meetup.search(params[:term])
  end

  def show
    flash[:user_meetup] = {
      meetup_id: Meetup.find(params[:id]).id,
      user_id: current_user.id
     }
    # @rsvp = UserMeetup.where(user_id: current_user.id && meetup_id: @meetup.id)
    # byebug
    if UserMeetup.where("user_id = ? AND meetup_id = ?", "#{current_user.id}", "#{@meetup.id}" )[0]
      @rsvp = UserMeetup.where("user_id = ? AND meetup_id = ?", "#{current_user.id}", "#{@meetup.id}" )[0]
    end
    # byebug
    flash[:meetup] = Meetup.find(params[:id])
  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params(:campaign_id, :location, :meet_time, :number_of_hours))
    if @meetup.save
      redirect_to meetup_path(@meetup)
    else
      flash[:errors] = @meetup.errors.full_messages
      redirect_to new_meetup_path
    end
  end

  def edit

  end

  def update
    if @meetup.update(meetup_params(:location, :meet_time, :number_of_hours))
      redirect_to meetup_path(@meetup)
    else
      flash[:errors] = @meetup.errors.full_messages
      redirect_to edit_meetup_path(@meetup)
    end
  end

  def destroy
    @meetup.destroy
    redirect_to meetups_path
  end

  private

  def find_meetup
    @meetup = Meetup.find(params[:id])
  end

  def meetup_params(*args)
    params.require(:meetup).permit(*args)
  end
end
