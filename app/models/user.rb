class User < ApplicationRecord
  has_secure_password

  # Для удобства пока выключаем
  # validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  has_many :queries, dependent: :destroy
end
