Rails.application.routes.draw do
  resources :shelves
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users do 
    resources :books, only:[:new, :create, :index]
  end 
  resources :books, only: [:destroy, :show, :edit, :update]
  resource :session, only: [:new, :create, :destroy]

  get "/search", to: "searches#search_google_engine"
end


