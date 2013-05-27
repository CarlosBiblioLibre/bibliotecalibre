class BiblioLibreController < ApplicationController

	def index
		@findings = Finding.last(4).reverse
	end
end
