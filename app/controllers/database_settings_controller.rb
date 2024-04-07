class DatabaseSettingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def load_db
    @loaded_db = XmlToDatabase.new(file: params[:file].instance_variable_get(:@tempfile), user_id: session[:user_id]).perform

    flash[:success] = "База данных успешно обновлена"
  end

  def db_versions
    @db_versions = DbVersion.all

    @db_versions = @db_versions.map do |db_version|
      {
        id: db_version.id,
        name: User.find_by(id: db_version.user_id).login,
        version: db_version.version,
        date: db_version.created_at.strftime('%d.%m.%Y %H:%M')
      }
    end

    render json: { items: @db_versions }
  end

  def main_statistics_db
    render json: {
      users: {
        count: User.count,
        created: User.first.created_at.strftime('%d %B %Y')
      },
      queries: {
        count: Query.count,
        created: Query.first.created_at.strftime('%d %B %Y')
      },
      db_versions: {
        count: DbVersion.count,
        created: DbVersion.first.created_at.strftime('%d %B %Y')
      },
      today: Time.zone.now.strftime('%d %B %Y')
    }
  end

  def side_statistics_db
    render json: {
      records_count: XmlItem.count,
      volume: Marshal::dump(XmlItem.all).size
    }
  end
end
