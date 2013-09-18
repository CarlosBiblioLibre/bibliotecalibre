BiblioLibre::Application.routes.draw do

  resources :posts


  devise_for :users

  resources :releases
  resources :findings
  resources :books

  get '/books/:code/ajax' => 'books#show_by_code', as: 'books_ajax'

  get '/check_code' => 'books#check_code'
  get '/new_book_and_finding/:code'  => 'books#new_book_and_finding', as: 'new_book_and_finding'
  get '/new_book_and_release' => 'books#new_book_and_release', as: 'new_book_and_release'

  get '/new_finding_with_code/:code' => 'findings#new_with_code', as: 'new_finding_with_code'

  get '/map' => 'findings#map', as: 'findings_map'

  get '/bibliotecas' => 'biblio_libre#bibliotecas', as: 'bibliotecas'
  get '/faq' => 'biblio_libre#faq', as: 'faq'
  get '/que_es' => 'biblio_libre#que_es', as: 'que_es'

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
	match 'contact' => 'contact#create', :as => 'contact', :via => :post

  match 'invitanos' => 'contact#invitanos', :as => 'invitanos', :via => :get
  match 'invitanos' => 'contact#invitanos_create', :as => 'invitanos', :via => :post

  match 'dona' => 'contact#dona', :as => 'dona', :via => :get
  match 'dona' => 'contact#dona_create', :as => 'dona', :via => :post

  match 'concurso' => 'contact#concurso', :as => 'concurso', :via => :get
  match 'concurso' => 'contact#concurso_create', :as => 'concurso', :via => :post

  get '/QR' => 'biblio_libre#index'
  get '/qr' => 'biblio_libre#index'

  get '/nuevo_home' => 'biblio_libre#index_nuevo'

  get '/noticias/1' => 'biblio_libre#noticia1', :as => 'noticia1'
  get '/noticias/2' => 'biblio_libre#noticia2', :as => 'noticia2'
  get '/noticias/3' => 'biblio_libre#noticia3', :as => 'noticia3'
  get '/noticias/4' => 'biblio_libre#noticia3', :as => 'noticia4'


  root to: 'biblio_libre#index_nuevo'
end