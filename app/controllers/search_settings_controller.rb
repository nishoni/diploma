class SearchSettingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def setting_fields
    render json: { user: current_user }
  end

  def save_settings
    current_user.update!(
      coefficient: params[:coefficient].to_f / 100,
      max_result_count: params[:max_result_count].to_i
    )

    Rails.logger.info(current_user)

    flash[:success] = "The user successfully updated"
    render json: { user: current_user }
  end
end
