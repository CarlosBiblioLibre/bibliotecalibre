class HeartsController < ApplicationController
	def create
		@heart = Heart.new(params[:heart])

		if @heart.save
			redirect_to "/resultados", notice: "Tu voto fue contado"
		else
			redirect_to root_url, notice: "Hubo un problema con tu voto."
		end
	end
end