# frozen_string_literal: true

class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  before_action :ensure_user_privileges!

  def execute
    result = RailsGraphqlSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

  def variables
    @_variables ||= prepare_variables(params[:variables])
  end

  def query
    @_query ||= params[:query]
  end

  def operation_name
    @_operation_name ||= params[:operationName]
  end

  def context
    @_context ||= {
      # Query context goes here, for example:
      current_user: current_user
    }
  end

  # Protect mutations with create, update, destroy to authorized users only
  def ensure_user_privileges!
    authenticate_from_token! if protected_query?
  end

  def protected_query?
    %w[create update delete]
      .freeze
      .select { |word| query.downcase.include?(word) }
      .any?
  end

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(err)
    logger.error err.message
    logger.error err.backtrace.join("\n")

    render json: { errors: [{ message: err.message, backtrace: err.backtrace }], data: {} }, status: 500
  end
end
