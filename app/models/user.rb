# frozen_string_literal: true

class User < ApplicationRecord
  include UserToken

  has_one :token
end
