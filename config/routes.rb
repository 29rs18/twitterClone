# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :tweets do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tweets, except: [:new, :edit] do
        resources :likes, only: [:create, :destroy]
        resources :comments, only: [:create]
      end
      devise_scope :user do
        post 'sign_up', to: 'registrations#create'
        post 'sign_in', to: 'sessions#create'
        delete 'sign_out', to: 'sessions#destroy'
      end
    end
  end
end
