require 'rails_helper'

RSpec.describe 'Destination', type: :request do
  before(:example) do
    @user = build(:user)
    @user.save
    @destination = build(:destination)
    @destination.save

    post '/api/v1/sessions', params: { username: @user.username, password: @user.password }
  end

  describe 'GET #index' do
    it 'returns http success' do
      get api_v1_destinations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get api_v1_destination_path(@destination.id)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST#create' do
    it 'returns http success' do
      post api_v1_destinations_path, params: {
        name: 'New Destination', description: 'New Description', image_url: 'New Image', city_name: 'new city'
      }
      expect(response).to have_http_status(:success)
    end
  end
end
