Rails.application.routes.draw do
  
  devise_for :users
  root to: 'welcome#index'
  get 'about' => 'welcome#about'
  post :incoming, to: "incoming#create"

end
