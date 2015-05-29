Rails.application.routes.draw do
  resources :forums
  resources :videos
  get 'welcome/index'
  root 'welcome#index'
end
