Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :api do
    post "/users" => "users#create"

    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
  end

  namespace :client do
    get '/products' => 'products#index'
    get '/products/new' => 'products#new'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    get '/products/:id/edit' => 'products#edit'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    get "/orders" => "orders#index"
    post "/orders" => "orders#create"

    get "/signup" => "users#new"
    post "/users" => "users#create"

    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    get "/logout" => "sessions#destroy"
  end
end
