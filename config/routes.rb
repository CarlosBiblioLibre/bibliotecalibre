BiblioLibre::Application.routes.draw do
 
  devise_for :users

  resources :releases
  resources :findings
  resources :books

  get '/books/:code/ajax' => 'books#show_by_code', as: 'books_ajax'

  root to: 'biblio_libre#index'
end
