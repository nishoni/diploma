class QueriesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

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

  def destroy
    @query = current_user.queries.find(params[:id])
    @query.destroy

    flash[:success] = "The to-do item was successfully destroyed."
  end

  private

  def query_params
    params.require(:query).permit(:word, :time_start)
  end
end
