class BiblioLibreController < ApplicationController

	def index
		@findings = Finding.last(5).reverse
	end

	def index_nuevo
		@findings = Finding.last(5).reverse
	end
end