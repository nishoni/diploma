class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sign_in; end

  def signing_in
    user = User.find_by(email: params[:email], password: params[:password])

    # TODO: Добавить нотификацию
    # Добавить сессии
    if user
      render json: { path: '/' }
    else
      render json: { path: '/sign_in' }
    end
  end

  def sign_up; end

  def create
    user = User.new(user_params)

    # TODO: Добавить нотификацию
    if user.save!
      # и вот за это я попаду в ад...
      render json: { path: '/' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:login, :email, :password)
  end
end
