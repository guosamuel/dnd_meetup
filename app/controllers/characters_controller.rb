class CharactersController < ApplicationController
  before_action :find_character, only: [:show, :edit, :update]
  def index
    @characters = Character.all
  end

  def show

  end

  def new
    @character = Character.new
    @campaign = UserMeetup.last.meetup.campaign.id
    # byebug
    @alignments = Character.alignment_list
    @races = Character.race_list
    @klasses = Character.klass_list
    # flash[:meetuptransfer2] = flash[:meetuptransfer]
  end

  def create
    flash[:meetup2] = flash[:meetup]
    @character = Character.new(character_params(:campaign_id, :alignment, :char_name, :race, :weapon, :level, :klass, :user_id))
    @character.save
    if @character.valid?
      redirect_to character_path(@character)
    else
      flash[:errors] = @character.errors.full_messages
      redirect_to meetups_path
    end
  end

  def edit

  end

  def update
    @character.update(character_params(:weapon, :level))
    redirect_to character_path(@character)
  end

  private

  def find_character
    @character = Character.find(params[:id])
  end

  def character_params(*args)
    params.require(:character).permit(*args)
  end
end
