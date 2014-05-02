class BiblioLibreController < ApplicationController

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
end