class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :redirect_if_authenticated, only: [:new, :create]

  def destroy
    session[:user_id] = nil
    render json: { path: '/sign_up', message: "Вышли из аккаунта" }
  end

  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { path: '/', message: "Welcome, #{@user.login}!" }
    else
      render json: { path: '/sign_in', message: "Error" }
    end
  end
end
