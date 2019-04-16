class CharactersController < ApplicationController
  before_action :find_character, only: [:show, :edit, :update]
  def index
    @characters = Character.all
  end

  def show

  end

  def new
    @character = Character.new
    @camp_id = UserMeetup.last.meetup.campaign.id
    byebug
  end

  def create
    @character = Character.new(character_params(:campaign_id, :alignment, :char_name, :race, :weapon, :level, :klass))
    @character.save
    redirect_to character_path(@character)
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
