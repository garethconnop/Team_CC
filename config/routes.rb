Rails.application.routes.draw do
  devise_for :users

  resources :forums do
  	resources :forum_comments
  end

  resources :videos
  
  get 'welcome/index'
  root 'welcome#index'
end
