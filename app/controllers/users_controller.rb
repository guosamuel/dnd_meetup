class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def show

  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(user_params(:first_name, :last_name, :username, :email_address, :start_date))
    @user = User.new(user_params(:first_name, :last_name, :email_address, :user_name, :password))
    @user.start_date = Time.now
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit

  end

  def update
    if @user.update(user_params(:first_name, :last_name, :email_address))
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user.destroy
    redirect_to home_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end

end
