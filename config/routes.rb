Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get 'api/v1/tutors', to: 'tutors#index'
  post 'api/v1/tutors', to: 'tutors#create'
  delete 'api/v1/tutors/:id', to: 'tutors#destroy'
  post 'api/v1/login', to: 'users#login'
  post 'api/v1/signup', to: 'users#signup'
  delete 'api/v1/reservation/:id', to: 'reservations#destroy'
  post 'api/v1/reservation/', to: 'reservations#create'

end
