Rails.application.routes.draw do
  resources :my_gists

  resources :projects
  post '/projects/:id/join', to: 'projects#join'
  delete '/projects/:id/leave', to: 'projects#leave'
  get '/projects/:id/gist/new', to: 'projects#new_gist'

  resources :code_snippets

  resources :users

  get '/signin', to: 'sessions#new', as: :signin_form
  post '/signin', to: 'sessions#create', as: :signin
  get '/signout', to: 'sessions#destroy', as: :signout

  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
