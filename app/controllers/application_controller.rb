# frozen_string_literal: true

class ApplicationController < ActionController::API
  class AuthenticationError < StandardError; end

  rescue_from AuthenticationError, with: :authentication_error

  private

  def authentication_error(_error)
    render json: { message: 'Unauthorized user' }, status: :unauthorized
  end
end
