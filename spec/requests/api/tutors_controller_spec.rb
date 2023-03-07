require 'swagger_helper'

RSpec.describe 'tutors', type: :request do
  describe '/api/v1/tutors' do
    path '/api/v1/tutors' do
      post 'Creates a tutor' do
        tags 'Tutors'
        consumes 'application/json'
        parameter name: :tutor, in: :body, schema: {
          type: :object,
          properties: {
            first_name: { type: :string },
            last_name: { type: :string },
            photo_url: { type: :string },
            description: { type: :text },
            fb_link: { type: :string },
            ig_link: { type: :string },
            twitter_link: { type: :string },
            hourly_fee: { type: :integer },
            experience: { type: :integer },
            rating: { type: :integer }
          },
          required: %w[first_name last_name photo_url hourly_fee experience]
        }

        response '201', 'Tutor has been created successfully!' do
          let(:tutor) { { first_name: 'stanley', last_name: 'jimbo', photo_url: 'https://thumbs.dreamstime.com/b/beautiful-96.jpg', description: 'Jim was a bald teachers. He knows about Pythagora', hourly_fee: 20, experience: 3 } }
          run_test!
        end

        response '406', 'Something went wrong.' do
          let(:tutor) { { first_name: 'stanley', last_name: 'jimbo' } }
          run_test!
        end
      end
    end

    path '/api/v1/tutors' do
      get 'Retrieves Tutors' do
        tags 'Tutors'
        produces 'application/json'
        request_body_example value: { some_field: 'Foo' }, name: 'basic', summary: 'Request example description'

        response '200', 'Tutors found' do
          schema type: :array,
                 properties: {
                   first_name: { type: :string },
                   last_name: { type: :string },
                   photo_url: { type: :string },
                   description: { type: :text },
                   fb_link: { type: :string },
                   ig_link: { type: :string },
                   twitter_link: { type: :string },
                   hourly_fee: { type: :integer },
                   experience: { type: :integer },
                   rating: { type: :integer }
                 },
                 required: %w[first_name last_name photo_url hourly_fee experience]

          let(:id) { Tutor.create(first_name: 'stanley', last_name: 'jimbo', photo_url: 'https://thumbs.dreamstime.com/b/beautiful-96.jpg', description: 'Jim was a bald teachers. He knows about Pythagora', hourly_fee: 20, experience: 3).id }
          run_test!
        end
      end
    end

    path '/api/v1/tutors/{id}' do
      delete 'Destroy a tutor' do
        tags 'Tutors'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string
        produces 'application/json'

        response '200', 'Tutor has been destroyed successfully!' do
          schema type: :object,
                 properties: {
                   first_name: { type: :string },
                   last_name: { type: :string },
                   photo_url: { type: :string },
                   description: { type: :text },
                   fb_link: { type: :string },
                   ig_link: { type: :string },
                   twitter_link: { type: :string },
                   hourly_fee: { type: :integer },
                   experience: { type: :integer },
                   rating: { type: :integer }
                 }

          let(:id) { Tutor.create(first_name: 'stanley', last_name: 'jimbo', photo_url: 'https://thumbs.dreamstime.com/b/beautiful-96.jpg', description: 'Jim was a bald teachers. He knows about Pythagora', hourly_fee: 20, experience: 3).id }
          run_test!
        end
      end
    end
  end
end
