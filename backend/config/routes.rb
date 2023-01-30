Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    resources :pokemon, only: [:show, :update, :index, :create] do 
      # resources :types, only: [:index]
      resources :items, only: [:index, :create]
    end
    resource :pokemon do
      resources :types, only: [:index]
    end
    # end
    resources :items, only: [:update, :destroy]
  end
end
