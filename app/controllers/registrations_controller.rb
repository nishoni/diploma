class RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new(user_params)

    # TODO: Добавить нотификацию
    if @user.save!
      session[:user_id] = @user.id
      # и вот за это я попаду в ад...
      render json: { path: '/', message: 'Вы создали аккаунт!' }
    else
      render json: { path: '/sign_up', message: 'Что-то пошло не так' }
    end
  end

  private

  def user_params
    params.permit(:login, :email, :password)
  end
end
