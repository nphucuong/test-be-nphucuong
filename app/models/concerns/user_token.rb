# frozen_string_literal: true

module UserToken
  extend ActiveSupport::Concern

  included do
    def generate_token
      token = Token.find_by(user_id: id)
      return token if token.present?

      token = init_token 
      token.save!
      token
    end

    def init_token
      token = Token.create(user_id: id)
      token.token = SecureRandom.hex(32)
      token
    end

    def current_token
      Token.find_by(user_id: id, token: token)
    end

    def reset_token!
      current_token&.destroy!
    end

    def self.from_token(token)
      return nil unless (token = Token.find_by('token = ?', token))

      token.user
    end
  end
end
