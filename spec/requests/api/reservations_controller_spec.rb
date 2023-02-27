require 'swagger_helper'

RSpec.describe 'api/reservations', type: :request do
  path '/api/v1/reservation' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          tutor_id: { type: :integer },
          city: { type: :string },
          date: { type: :string },
          hour: { type: :string }
        },
        required: %w[user_id tutor_id city date hour]
      }

      response '201', 'Reservation created' do
        let(:reservation) { { user_id: 1, tutor_id: 1, date: '25-09-2023', hour: '1pm - 2pm', city: 'Tokyo' } }
        run_test!
      end

      response '406', 'Reservation not created' do
        let(:reservation) { { user_id: 1, tutor_id: 1, date: '25-09-2023', hour: '1pm - 2pm' } }
        run_test!
      end

      response '406', 'Reservation not created' do
        let(:reservation) { { user_id: 1, tutor_id: 1, city: 'LA', date: '2023-09-10', hour: '9pm - 10pm' } }
        run_test!
      end
    end
  end

  path '/api/v1/reservation/{id}' do
    delete 'Deletes a reservation' do
      tags 'Reservations'
      produces 'application/json'
      parameter name: :id, in: :path, type: :integer

      response '200', 'Reservation deleted' do
        let(:id) do
          Reservation.create(user_id: 1, tutor_id: 1, date: '25-09-2023', hour: '1pm - 2pm', city: 'Tokyo').id
        end
        run_test!
      end

      response '404', 'Reservation not found' do
        let(:id) { 500 }
        run_test!
      end
    end
  end
end
