class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update]
  def index
    @campaigns = Campaign.all
  end

  def show

  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params(:title, :expect_number_of_meetups, :difficulty, :max_number_of_characters))
    @campaign.save
    if @campaign.valid?
      Character.create(campaign_id: @campaign.id, user_id: current_user.id, char_name: "Dungeon Master")
      flash[:campaign] = @campaign.id
      flash[:campaign_title] = @campaign.title
      redirect_to new_meetup_path
    else
      byebug
      redirect_to campaigns_path
    end
  end

  def edit

  end

  def update
    @campaign.update(:expect_number_of_meetups, :difficulty, :max_number_of_characters)
    redirect_to campaign_path(@campaign)
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params(*args)
    params.require(:campaign).permit(*args)
  end
end
