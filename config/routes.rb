Rails.application.routes.draw do
  resources :books, path: 'api/v1/books'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # 'api/books/
end
