class BiblioLibreController < ApplicationController

	def index
		@findings = Finding.last(4).reverse
	end

	def index_nuevo
		@findings = Finding.last(4).reverse
	end
end