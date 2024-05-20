class HistoryController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def queries
    user_queries = current_user.queries.reverse.map do |query|
      {
        id: query.id,
        word: query.word,
        time_start: query.time_start.strftime('%d.%m.%Y %H:%M')
      }
    end

    pp user_queries.last

    render json: { queries: user_queries }
  end

  def export
    search ||= Search.new(search_field: params[:search_field], user_id: session[:user_id], is_history: true)
    search.perform

    send_data CsvExport.new(items: search.items).perform,
                            filename: "#{params[:search_field]}-#{Time.zone.now.strftime('%d.%m.%Y_%H.%M')}.csv"
  end

  def search
    user_queries = current_user.queries.where("word LIKE ?", "%#{params[:search_field]}%").reverse
    user_queries = user_queries.map do |query|
      {
        id: query.id,
        word: query.word,
        time_start: query.time_start.strftime('%d.%m.%Y %H:%M')
      }
    end

    render json: { queries: user_queries }
  end
end
