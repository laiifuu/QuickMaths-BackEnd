Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

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



# 1. Ensure you have defined default url options in your environments files. Here
#      is an example of default_url_options appropriate for a development environment
#      in config/environments/development.rb:

#        config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

#      In production, :host should be set to the actual host of your application.

#      * Required for all applications. *

#   2. Ensure you have defined root_url to *something* in your config/routes.rb.
#      For example:

#        root to: "home#index"
     
#      * Not required for API-only Applications *

#   3. Ensure you have flash messages in app/views/layouts/application.html.erb.
#      For example:

#        <p class="notice"><%= notice %></p>
#        <p class="alert"><%= alert %></p>

#      * Not required for API-only Applications *

#   4. You can copy Devise views (for customization) to your app by running:

#        rails g devise:views
       
#      * Not required *
