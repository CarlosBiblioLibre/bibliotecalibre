require 'csv'

class BiblioLibreController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :index_nuevo, :colaboradores,
																							:about, :bibliotecas, :invitanos, :que_es, :galerias,
																							:galeria1, :galeria2, :galeria3, :galeria4, :galeria5,
																							:galeria6, :galeria7, :sociales, :bibliocabinas, :diab]

	def index
		@findings = Finding.last(4).reverse
	end

	def index_nuevo
		@findings = Finding.last(4).reverse
		@posts = Post.last(3).reverse

		@post_liberacion = Post.byKind "liberación"
		@post_noticia = Post.byKind "noticia"
    	@battle = Battle.last
		@post_com1 = Post.byKind "comunidad 1"
		@post_com2 = Post.byKind "comunidad 2"
		@post_columna =  Post.byKind "columna"
		@post_com3 = Post.byKind "comunidad 3"

	end

	def uploads

    	fileUp = params[:file]
		orig_filename =  fileUp.original_filename

	  	#filename = sanitize_filename(orig_filename)

		filename = orig_filename # TODO: CAMBIAR ESTO

	 	image = Image.new

	 	image.image = fileUp
	 	image.name = params[:alt]

	 	image.save

		# AWS::S3::S3Object.store(orig_filename, fileUp.read, "bibliorock", :access => :public_read)

    	render json: {
      		image: {
        		url: image.image.url
      		}
    	}, content_type: "text/html"
  end

    def massive_load
    end

	def proccess_massive_load
		if not params[:file]
			flash.now.alert = "Debe subir un archivo"
			render :massive_load
			return
		end

		csv_file = params[:file]
		libros = 0
	  	CSV.foreach(csv_file.tempfile, headers: true, return_headers: false, encoding: 'UTF-8') do |row|
		    row_hash = row.to_hash
		    p row_hash

		    book = {}

		    book[:title] = row_hash['TITULO']
		    book[:code] = row_hash['CODIGO']
		    book[:author] = row_hash['AUTOR'] 
		    book[:genre] = row_hash['GENERO']

		    finding = {}

		    finding[:email] = row_hash['MAIL']
		    finding[:username] = row_hash['NOMBRE']
		    finding[:location] = row_hash['POSICION']
		    finding[:how] = "En una liberación (Carga masiva)"

		    new_book = Book.find_or_initialize_by_code(book)
		    new_book.save

		    # # TODO: No crear findings repetidos al hacer 2 veces este script
		    # #       ver los findings del libro y revisar las locations y compararlas con 
		    # #       el location de mas arriba
		    finding[:book_id] = new_book.id
		    new_finding = Finding.new(finding)
		    new_finding.save

		    p "*"*20
		    p new_book
		    p new_finding
		    libros = libros + 1
		end
		redirect_to(massive_load_path, :notice => "Exito: #{libros} cargados")
	end

  def colaboradores
  end

  def about
  end

  def diab
  end

end