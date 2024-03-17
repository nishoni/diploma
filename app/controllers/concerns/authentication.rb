module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: "You are already logged in." if user_signed_in?
  end

  def authenticate_user!
    redirect_to sign_in_path, alert: "You are not logged in." unless user_signed_in?
  end

  private

  def current_user
    @user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    @user.present?
  end
end