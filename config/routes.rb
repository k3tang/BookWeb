Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do 
    resources :books, except: [:destroy]
  end 
  resources :books, only: [:destroy]
  resource :session, only: [:new, :create, :destroy]
end
