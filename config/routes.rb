Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/login" => "sessions#new"
end
