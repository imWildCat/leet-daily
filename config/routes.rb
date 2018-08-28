Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  namespace :admin do
    root to: 'home#index'
    resources :leetcode_users
    resources :site_configs
    resources :leetcode_user_checkins, only: [:index, :show, :edit, :update]
  end

end
