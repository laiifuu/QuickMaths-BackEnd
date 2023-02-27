require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  describe 'Signup' do
    path '/api/v1/signup' do
      post 'Creates an user' do
        tags 'Users Signup'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            username: { type: :string }
          },
          required: ['username']
        }

        response '201', 'user created' do
          let(:user) { { username: 'Hansen234' } }
          run_test!
        end

        response '406', 'Not acceptable' do
          let(:user) { { username: 'H' } }
          run_test!
        end
      end
    end
  end

  describe 'Login' do
    path '/api/v1/login' do
      post 'Logs in an user' do
        tags 'Users Login'
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            username: { type: :string }
          },
          required: ['username']
        }

        response '200', 'Logged in' do
          User.create(username: 'Hansen23')
          let(:user) { { username: 'Hansen23' } }
          run_test!
        end

        response '404', 'Not acceptable' do
          let(:user) { { username: 'Random_user23' } }
          run_test!
        end
      end
    end
  end
end
