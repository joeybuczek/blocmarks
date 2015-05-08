Rails.application.routes.draw do

  get 'users/show'

  root to: 'welcome#index'
  
  get 'about' => 'welcome#about'
  
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
  end
  
  post :incoming, to: "incoming#create"
  
  devise_for :users
  resources :users, only: [:show]

end
