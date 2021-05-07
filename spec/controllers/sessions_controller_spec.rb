# frozen_string_literal: true

require 'test_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'login' do
    let(:user) { create(:user) }

    context 'with exact uid' do
      before do
        post :login, params: {
          provider: 'FACEBOOK',
          uid: user.uid
        }
      end

      it 'validates' do
        expect(response).to be_success
        JSON.parse(response.body).tap do |json|
          token = Token.find_by(token: json['token'])
          expect(token.user_id).to eq(user.id)
        end
      end
    end
  end
end
