class ApplicationController < ActionController::Base
  def login
    current_user
  end

  def current_user
    session[:user] = User.find_by(id: 1)
  end
end
