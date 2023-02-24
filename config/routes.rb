Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # namespace :api do
  #   namespace :v1 do
  #     resources :users, only: [:create] do 
  #       resources :reservations,  only: [:index, :create, :delete]
  #     end
  #     resources :tutors,  only: [:index, :create, :delete]
  # #   end
  # end

  get 'api/v1/tutors', to: 'tutors#index'
  post 'api/v1/tutors', to: 'tutors#create'
  delete 'api/v1/tutors/:id', to: 'tutors#destroy'
  post 'api/v1/login', to: 'users#login'
  
end
