# frozen_string_literal: true

class ApplicationController < ActionController::API
  class AuthenticationError < StandardError; end

  rescue_from AuthenticationError, with: :authentication_error

  private

  def current_user
    @_current_user ||= User.find_by(authorization_token: bearer_token)
  end

  # Check if the informed token exists and if it is not expired.
  def authenticate_from_token!
    raise AuthenticationError if bearer_token.nil?
    raise AuthenticationError unless current_user
    raise AuthenticationError unless current_user.valid_token?
  end

  def bearer_token
    @_bearer_token ||= request
                       .headers['Authorization']
      &.scan(/Bearer (.+)/)
      &.flatten
      &.first
  end

  def authentication_error(_error)
    render json: { message: 'Unauthorized user' }, status: :unauthorized
  end
end
