require 'swagger_helper'

RSpec.describe 'Trekker API', type: :request do
  # User Registration
  path '/api/v1/registrations' do
    post 'Register' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          full_name: { type: :string },
          username: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: %w[full_name username email password password_confirmation]
      }

      response '201', 'user created' do
        let(:user) do
          { full_name: 'The Tester', username: 'tester', email: 'tester@example.com', password: 'password',
            password_confirmation: 'password' }
        end
        run_test!
      end

      response '422', 'Invalid request' do
        let(:user) { { full_name: 'The Tester', username: 'tester' } }
        run_test!
      end
    end
  end

  # User Login
  path '/api/v1/sessions' do
    post 'Sign in' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string }
        },
        required: %w[username password]
      }

      it 'returns http created' do
        user = build(:user)
        user.save
        post api_v1_sessions_path, params: { username: user.username, password: user.password }
        expect(response).to have_http_status(:created)
      end

      response '401', 'Invalid username or password' do
        let(:user) { { username: 'tester' } }
        run_test!
      end
    end
  end

  # Destinations
  path '/api/v1/destinations' do
    get 'Retrieve Destinations' do
      tags 'Destinations'

      response '200', 'destinations found' do
        after do |example|
          example.metadata[:response][:examples] = {
            'application/json' => JSON.parse(response.body, symbolize_names: true)
          }
        end
        run_test!
      end
    end
  end

  # Single Destination
  path '/api/v1/destinations/{id}' do
    get 'Retrieve Destination' do
      tags 'Destinations'
      parameter name: :id, in: :path, type: :integer

      response '200', 'destination found' do
        let(:id) { create(:destination).id }

        after do |example|
          example.metadata[:response][:examples] = {
            'application/json' => JSON.parse(response.body, symbolize_names: true)
          }
        end
        run_test!
      end
    end
  end
end
