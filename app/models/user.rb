# frozen_string_literal: true

class User < ApplicationRecord
  has_many :todos

  has_secure_password

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
