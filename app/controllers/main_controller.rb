class MainController < ApplicationController
  before_action :authenticate_user!

  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
