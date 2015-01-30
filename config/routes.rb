Rails.application.routes.draw do

  root 'podcasts#index'
  resources :articles, only: [:index, :show]
  resources :podcasts, only: [:index, :show]

  devise_for :users

  authenticate :user do
    namespace :admin do
      root to: 'articles#index'
      resources :articles, except: :show
      resources :podcasts, except: :show
    end
  end
end
