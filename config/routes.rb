Rails.application.routes.draw do

  root to: 'welcome#index'
  
  get 'about' => 'welcome#about'
  resources :topics
  resources :bookmarks, only: [:destroy]
  post :incoming, to: "incoming#create"
  
  devise_for :users

end
