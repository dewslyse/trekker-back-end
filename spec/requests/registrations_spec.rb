require 'rails_helper'

RSpec.describe 'registrations', type: :request do
  describe 'POST#create' do
    it 'returns http success' do
      post api_v1_registrations_path,
           params: { username: 'test', password: 'testteset', password_confirmation: 'testteset',
                     email: 'test@example.com', full_name: 'test test' }
      expect(response).to have_http_status(:success)
    end
  end
end
