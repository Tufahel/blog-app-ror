Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'user/sessions',
               registrations: 'user/registrations'
             }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api do
    resources :users, only: [:index, :show ] do
      resources :posts, only: [:index, :show] do
         resources :comments, only: [:index, :create]
      end
    end
  end

  root "users#index"
  resources :users, only: [:index, :show] do
     resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]  
      resources :likes, only: [:new, :create]
    end
  end
end
