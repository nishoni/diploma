class QueriesController < ApplicationController
  before_action :authenticate_user!

  def search
  end

  def search_settings
  end

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(query_params)

    if @query.save
      render :ok
    else
      render :error
    end
  end

  private

  def query_params
    params.require(:query).permit(:word, :time_start)
  end
end
