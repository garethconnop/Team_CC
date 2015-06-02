Rails.application.routes.draw do
  devise_for :users

  resources :forums do
  	collection do
  		get :active
  		get :unanswered
      get :my_posts
  	end
  	resources :forum_comments
  end

  resources :videos
  
  get 'welcome/index'
  root 'welcome#index'
end
