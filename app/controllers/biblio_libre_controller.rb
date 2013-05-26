class BiblioLibreController < ApplicationController

	def index
		@findings = Finding.last(4)
	end
end
