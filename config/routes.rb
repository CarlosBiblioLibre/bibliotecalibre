BiblioLibre::Application.routes.draw do
  resources :findings
  resources :books

  get '/books/:code/ajax' => 'books#show_by_code', as: 'books_ajax'

  root to: 'biblio_libre#index'
end
