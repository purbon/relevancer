Rails.application.routes.draw do


  get 'relevancer/index'

  namespace :admin do
    root to: "admin#index"
    resources :query
  end

  root 'relevancer#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
