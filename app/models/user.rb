# frozen_string_literal: true

class User < ApplicationRecord
  TOKEN_EXPIRATION_TIME = 1.hour

  # Include default devise modules. Others available are:
  # :registerable, :recoverable, :rememberable, :validatable
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  def self.authenticate(email, password)
    user = User.find_by(email: email)

    return false unless user.present? && user&.valid_password?(password)

    user.generate_authorization_token

    user
  end

  def access_token_expires_at
    return unless authorization_token_generated_at.present?

    authorization_token_generated_at + TOKEN_EXPIRATION_TIME
  end

  def generate_authorization_token
    now = Time.current
    string = "#{email}-#{now.to_i}"
    token = Digest::MD5.hexdigest(string)

    update(
      authorization_token: token,
      authorization_token_generated_at: now
    )

    token
  end
end
