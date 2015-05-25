Rails.application.routes.draw do
  resources :videos
  get 'welcome/index'
  root 'welcome#index'
end
