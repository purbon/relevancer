Rails.application.routes.draw do


  devise_for :users, :controllers => { registrations: 'register' }

  get 'relevancer/index'
  post 'relevancer/report'
  get 'search',  to: 'relevancer#search'


  resources :report
  resources :judgements

  namespace :admin do
    root to: "admin#index"
    resources :query
    resources :schema
    get '/schema/mapping/:index', to: 'schema#mapping'
    post '/schema/fields', to: 'schema#fields'
  end

  root 'relevancer#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
