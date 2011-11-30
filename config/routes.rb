HomestuffHAML::Application.routes.draw do


  get "sessions/new", as: :new_session
  post "sessions/create", controller: "sessions", action: "create"
  delete "sessions", controller: "sessions", action: "destroy", as: :delete_session

  resources :users  
  resources :items
  
  root to: "items#index"
  
end
