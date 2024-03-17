class MainController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def search
    @search ||= Search.new(search_field: params[:search_field], user_id: session[:user_id])
    @search.perform

    if @search
      render json: { items: @search.items, statistics: @search.statistics }
    end
  end

  def export
    # тут csv экспорт
  end
end
