# frozen_string_literal: true

class SessionsController < ApiController
  skip_before_action :verify_authenticity_token
  skip_before_action :authenticate_user, only: %i[login signup]

  def login
    return render_bad_request if params[:provider].blank? || params[:uid].blank?

    provider = params[:provider]
    uid = params[:uid]
    user = valid_user(provider, uid)
    if user
      user_token = user.generate_token
      render json: user.as_json.merge(token: user_token.token), success: true
    else
      logger.error('Login failed')
      render json: {}, success: false
    end
  end

  def signup
    return render_bad_request if params[:provider].blank? || params[:uid].blank?

    user = User.create(user_params)
    user_token = user.generate_token
    render json: user.as_json.merge(token: user_token.token), success: true
  end

  def valid_user(provider, uid)
    user = User.find_by(provider: provider, uid: uid)
    return nil unless user

    user
  end

  def logout
    current_user.reset_token!
    render json: {}, success: true
  end

  private

  def user_params
    params.permit(:id, :email, :name, :picture, :provider, :uid)
  end
end
