class MeetupsController < ApplicationController
  before_action :find_meetup, only: [:show, :edit, :update, :destroy]

  def index
    @meetups = Meetup.all
  end

  def show

  end

  def new
    @meetup = Meetup.new
  end

  def create
    @meetup = Meetup.new(meetup_params(:campaign_id, :location, :meet_time, :number_of_hours))
    redirect_to meetup_path(@meetup)
  end

  def edit

  end

  def update
    @meetup.update(:location, :meet_time, :number_of_hours)
    redirect_to meetup_path(@meetup)
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
