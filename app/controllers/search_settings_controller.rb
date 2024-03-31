class SearchSettingsController < ApplicationController
  before_action :authenticate_user!

  def setting_fields
    render json: { user: current_user }
  end
end
