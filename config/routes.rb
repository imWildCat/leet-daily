Rails.application.routes.draw do

  namespace :account do
    get 'forget_passwords/edit'
    get 'forget_passwords/update'
  end
  # namespace :account do
  #   get 'forget_password/edit'
  #   get 'forget_password/update'
  # end
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

  namespace :account do
    resource :forget_password, only: [:edit, :update]
  end

end
