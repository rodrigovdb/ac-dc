# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    render json: { authorization_token: user_by_basic_token.authorization_token,
                   expires_at: user_by_basic_token.access_token_expires_at }
  end

  private

  def user_by_basic_token
    @_user_by_basic_token || fetch_user_by_basic_token
  end

  def fetch_user_by_basic_token
    email, password = Base64.decode64(basic_token).split(/:/)

    user = User.authenticate(email, password)
    raise AuthenticationError unless user

    user
  end

  def basic_token
    token = request
            .headers['Authorization']
            .scan(/^Basic\s(.+)/)
            .flatten
            .first

    raise AuthenticationError unless token.present?

    token
  end
end
