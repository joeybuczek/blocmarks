Rails.application.routes.draw do

  root to: 'welcome#index'
  
  get 'about' => 'welcome#about'
  
  resources :topics do
    resources :bookmarks, except: [:index]
  end
  
  post :incoming, to: "incoming#create"
  
  devise_for :users

end
