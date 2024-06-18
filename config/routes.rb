Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get 'receptionists/dashboard', to: 'patients#index', as: 'receptionists_dashboard'
  get 'doctors/dashboard', to: 'doctors#dashboard', as: 'doctors_dashboard'
  get 'search', to: 'posts#search'
  get 'search_form', to: 'posts#form_search'

end
