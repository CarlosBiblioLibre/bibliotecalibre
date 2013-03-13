BiblioLibre::Application.routes.draw do
  resources :findings
  resources :books

  root to: 'findings#index'
end
