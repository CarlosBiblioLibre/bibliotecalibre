BiblioLibre::Application.routes.draw do

  resources :posts
  resources :hearts, only: :create

  get '/diab_portada' => 'diab#index', as: 'diab'

  get 'tags/:tag' => 'posts#comunidad', as: :tag
  get '/posts/comunidad' => 'posts#comunidad'
  get '/comunidad' => 'posts#comunidad', as: 'comunidad'
  get '/noticias/1' => 'biblio_libre#noticia1', :as => 'noticia1'
  get '/noticias/2' => 'biblio_libre#noticia2', :as => 'noticia2'
  get '/noticias/3' => 'biblio_libre#noticia3', :as => 'noticia3'
  get '/noticias/4' => 'biblio_libre#noticia4', :as => 'noticia4'
  get '/noticias/5' => 'biblio_libre#noticia5', :as => 'noticia5'
  get '/noticias/:id' => 'posts#noticia'
  get '/galeria1' => 'biblio_libre#galeria1'
  get '/galeria2' => 'biblio_libre#galeria2'
  get '/galeria3' => 'biblio_libre#galeria3'
  get '/galeria4' => 'biblio_libre#galeria4'
  get '/galeria5' => 'biblio_libre#galeria5'
  get '/galeria6' => 'biblio_libre#galeria6'
  get '/galeria7' => 'biblio_libre#galeria7'
  get '/sociales' => 'biblio_libre#sociales'
  get '/batalla' => 'biblio_libre#batalla'
  get '/resultados' => 'biblio_libre#resultados'
  get '/about' => 'biblio_libre#about'
  get '/galerias' => 'biblio_libre#galerias'
  get '/comunidad' => 'biblio_libre#comunidad'
  get '/about/faqs' => 'about#faqs'
  get '/about/equipo' => 'about#equipo'
  get '/bibliocabinas' => 'biblio_libre#bibliocabinas'

  get '/diab' => 'biblio_libre#diab'
  post '/participa_diab' => 'diab#participa'


  post '/tinymce_assets' => 'biblio_libre#uploads'

  get '/vota/:battle_id/:book' => 'battles#vote'

  get '/books/export' => 'books#export_data'

  # get '/zohoverify/verifyforzoho.html', to: redirect('/assets/verifyforzoho.html')

  devise_for :users

  resources :releases
  resources :findings
  resources :books

  resources :battles

  get '/books/:code/ajax' => 'books#show_by_code', as: 'books_ajax'

  get '/check_code' => 'books#check_code'
  get '/new_book_and_finding/:code'  => 'books#new_book_and_finding', as: 'new_book_and_finding'
  get '/new_finding_with_code/:code' => 'findings#new_with_code', as: 'new_finding_with_code'


  get '/libera' => 'books#new_book_and_release', as: 'new_book_and_release'
  get '/new_book_and_release' => 'books#new_book_and_release'
  post '/printables' => 'books#printables', as: 'printables'
  post '/printables_diab' => 'diab#printables', as: 'printables_diab'
  get '/generate_pdf/:code' => 'books#generate_pdf', as: 'generate_pdf'

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

  get '/emails' => 'findings#emails'

  get '/nuevo_home' => 'biblio_libre#index_nuevo'

  get '/instrucciones' => 'biblio_libre#instrucciones', :as => 'instrucciones'

  get '/colaboradores' => 'biblio_libre#colaboradores', :as => 'colaboradores'

  get '/donativos' => 'biblio_libre#donativos', :as => 'donativos'

  get '/bibliolibre' => 'biblio_libre#index_nuevo', as: 'portada'

  root to: 'biblio_libre#index_nuevo'
  # root to: 'diab#index'
end