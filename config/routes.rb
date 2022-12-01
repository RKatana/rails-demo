Rails.application.routes.draw do
  resources :authors
  resources :books, path: 'api/books'
  resources :authors, path: "api/authors"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # 'api/books/
  post "signin" => "sessions#create_session"
  get "signout" => "sessions#destroy"

  post "/login" => "token#generate_token"

end
