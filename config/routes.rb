Rails.application.routes.draw do
  devise_for :users, defaults: { format: 'json' },
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  namespace :api, defaults: { format: 'json' } do
    get '/user-data', to: 'users#show'
    resources :users do
      resources :posts do
        resources :comments
        resources :likes
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
