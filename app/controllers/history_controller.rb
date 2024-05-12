class HistoryController < ApplicationController
  before_action :authenticate_user!

  def queries
    render json: { queries: current_user.queries.reverse }
  end

  def export
    search ||= Search.new(search_field: params[:search_field], user_id: session[:user_id], is_history: true)
    search.perform

    send_data CsvExport.new(items: search.items).perform,
                            filename: "#{params[:search_field]}-#{Time.zone.now.strftime('%d.%m.%Y_%H.%M')}.csv"
  end
end
