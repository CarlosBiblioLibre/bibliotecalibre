BiblioLibre::Application.routes.draw do
  resources :findings
  resources :books

  root to: 'biblio_libre#index'
end
