class BiblioLibreController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :index_nuevo]

	def index
		@findings = Finding.last(4).reverse
	end

	def index_nuevo
		@findings = Finding.last(4).reverse
		@posts = Post.last(3).reverse

		@post_liberacion = Post.byKind "liberación"
		@post_noticia = Post.byKind "noticia"
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

end