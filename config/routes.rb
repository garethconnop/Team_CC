Rails.application.routes.draw do
  devise_for :users
  resources :forums
  resources :videos
  get 'welcome/index'
  root 'welcome#index'
end
