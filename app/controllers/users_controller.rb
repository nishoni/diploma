class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sign_in
    user = User.find_by(login: params[:login], password: params[:password])

    # TODO: Добавить нотификацию
    # Добавить сессии
    if user
      redirect_to :home
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
