# frozen_string_literal: true

class ApiController < ActionController::Base
  attr_reader :current_user
  before_action :authenticate_user

  protected

  def authenticate_user
    authenticate_or_request_with_http_token do |token|
      return render_user_unauthorized unless (@current_user = User.from_token(token))

      true
    end
  end

  def render_resource_not_found
    render json: { success: false }, status: 404
  end

  def render_user_unauthorized
    render json: { success: false }, status: :unauthorized
  end

  def render_bad_request
    render json: { success: false }, status: 400
  end
end
