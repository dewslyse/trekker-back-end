require 'rails_helper'

RSpec.describe 'Reservation', type: :request do
  before(:example) do
    load Rails.root + 'db/seeds.rb'
    # @user = build(:user)
    # @user.save
    # @destination = build(:destination)
    # @destination.save
    # @reservation = build(:reservation)

    post '/api/v1/sessions', params: { username: 'selase', password: 'password' }
  end

  describe 'GET #index' do
    it 'returns http success' do
      get api_v1_reservations_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST#create' do
    it 'returns http success' do
      post '/api/v1/destinations/:destination_id/reservations', params: {
        start_date: '2020-01-01', end_date: '2020-01-05'
      }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
