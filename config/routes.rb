Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
    root "users#index"
    get "users/:id" => "users#show", as: :users_next

    get "users/:user_id/posts/" => "posts#index", as: :users_posts

    get "users/:user_id/posts/new" => "posts#new", as: :posts_new
    post "users/:user_id/posts/new" => "posts#create", as: :posts_create

    get "users/:user_id/posts/:id" => "posts#show", as: :users_next_post

    get "users/:user_id/posts/:id/comments/new" => "comments#new", as: :comments_new
    post "users/:user_id/posts/:id/comments/new" => "comments#create", as: :comments_create

    get "users/:user_id/posts/:id/likes/new" => "likes#create", as: :likes_create
    
end
