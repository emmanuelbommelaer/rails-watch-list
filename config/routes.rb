Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/lists", to: "lists#index"
  post "/lists", to: "lists#create"
  get "/lists/new", to: "lists#new", as: "new_list"
  get "/lists/:id", to: "lists#show", as: "list"
  # Defines the root path route ("/")
 root to: "lists#index"
end
