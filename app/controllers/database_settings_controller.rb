class DatabaseSettingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def load_db; end

  def get_statistics_db; end
end
