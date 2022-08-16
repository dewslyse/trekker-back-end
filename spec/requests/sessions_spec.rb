require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  before(:example) do
    @user = build(:user)
  end

  describe 'POST#create' do
    it 'returns http success' do
      post api_v1_sessions_path, params: { session: { username: @user.username, password: @user.password } }
      expect(response).to have_http_status(:success)
    end
  end
end
