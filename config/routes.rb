Rails.application.routes.draw do
  resources :books, :users, :comments
  resources :books do
  	resources :comments
  end

  resources :comments do
  	resources :comments
  end

  get '/books/index/:id', to: 'books#index'

  root 'welcome#index'
end
