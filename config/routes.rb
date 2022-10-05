Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "works#index"

  get '/works', to: 'works#index', as: 'index'
  get '/works/new', to: 'works#new'
  get '/works/:id', to: 'works#show',as: 'work'
  
  # Defines the root path route ("/")
  # root "articles#index"
  resources :works
end
