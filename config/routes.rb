Rails.application.routes.draw do

  root 'podcasts#index'
  devise_for :users
  resources :articles, only: [:index, :show]
  resources :podcasts

  namespace :admin do
    root to: 'articles#index'
    resources :articles, except: :show
  end
end
