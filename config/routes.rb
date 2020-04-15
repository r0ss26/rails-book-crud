Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/books", to: "books#index"
  post "/books/create", to: "books#create" # Create

  get "/book/:id", to: "books#show" # Read
  put "/books/:id", to: "books#update" # Update
  delete "/books/:id", to: "books#destroy" # Delete

  get "/products", to: "products#index"
end
