class DiabController < ApplicationController
  layout 'diab'

  def index
    @book = Book.new
    @book.code = 'DB'+Book.generate_code
    @book.releases.build
  end

  def printables
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.js {  } # redirect_to @book, notice: 'Los datos han sido ingresados, muchas gracias!'
      end
    end
  end
end
