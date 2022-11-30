Rails.application.routes.draw do
  resources :authors
  resources :books, path: 'api/books'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # 'api/books/
end
