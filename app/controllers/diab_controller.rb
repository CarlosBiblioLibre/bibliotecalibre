class DiabController < ApplicationController
  layout 'diab'

  def index
    @book = Book.new
    @book.code = Book.generate_code
    @book.releases.build
  end
end
