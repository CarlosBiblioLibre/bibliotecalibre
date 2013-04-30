BiblioLibre::Application.routes.draw do
 
  devise_for :users

  resources :releases
  resources :findings
  resources :books

  get '/books/:code/ajax' => 'books#show_by_code', as: 'books_ajax'

  get '/check_code' => 'books#check_code'

  get '/new_book_and_finding/:code' => 'books#new_book_and_finding', as: 'new_book_and_finding'

  get '/new_finding_with_code/:code' => 'findings#new_with_code', as: 'new_finding_with_code'

  root to: 'biblio_libre#index'
end
