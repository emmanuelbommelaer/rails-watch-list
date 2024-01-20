Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: "lists#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "/lists", to: "lists#index"
  # post "/lists", to: "lists#create"
  # get "/lists/new", to: "lists#new", as: "new_list"
  # get "/lists/:id", to: "lists#show", as: "list"



  resources :lists, only: [:index, :create, :new, :show] do
    resources :bookmarks, only: [:new, :create]
  end

  delete "bookmarks/:id", to: "bookmarks#destroy", as: :destroy_bookmark

  # resources :bookmarks, only: :destroy


end
