Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "users#index"
    get "users/:id" => "users#show"

    get "users/:user_posts" => "posts#index"
    get "users/:user_post/:id" => "posts#show"
end
