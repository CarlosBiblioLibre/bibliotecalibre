class BiblioLibreController < ApplicationController

	def index
		@findings = Finding.last(5).reverse
	end
end
