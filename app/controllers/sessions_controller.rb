# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    render json: { token: user_jwt }
  end

  private

  def user_jwt
    response = { token: user.authorization_token, expires_at: user.authorization_token_expires_at }
    key = Rails.application.secrets.secret_key_base

    JWT.encode(response, key, 'HS256')
  end

  def user
    @_user ||= fetch_user
  end

  def fetch_user
    user = User.authenticate(params[:email], params[:password])
    raise AuthenticationError unless user

    user
  end
end
