require 'swagger_helper'

RSpec.describe 'Trekker API', type: :request do
  path '/api/v1/registrations' do
    post 'Register' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          full_name: { type: :string },
          username: { type: :string, example: 'tester' },
          email: { type: :string, example: 'tester@example.com' },
          password: { type: :string, example: 'password' },
          password_confirmation: { type: :string, example: 'password' }
        },
        required: [ 'full_name', 'username', 'email', 'password', 'password_confirmation' ]      
      }

      response '201', 'user created' do
        let(:user) { { full_name: 'The Tester', username: 'tester', email: 'tester@example.com', password: 'password', password_confirmation: 'password' } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:user) { { full_name: 'The Tester', username: 'tester' } }
        run_test!
      end
    end
  end

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
        required: [ 'username', 'password' ]
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
end
