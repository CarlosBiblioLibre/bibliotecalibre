# encoding: utf-8

require "prawn"

class BooksController < ApplicationController
  before_filter :authenticate_user!, except: [:show_by_code, :check_code, :new_book_and_finding,
                                              :new_book_and_release, :show, :create, :printables,
                                              :generate_pdf]

  def check_code
    if Book.find_by_code(params[:code])
      redirect_to "/new_finding_with_code/#{params[:code]}", code: params[:code]
    else
      redirect_to "/new_book_and_finding/#{params[:code]}", code: params[:code]
    end
  end

  def new_book_and_finding
    @book = Book.new
    @book.findings.build
  end

  def new_book_and_release
    @book = Book.new
    @book.code = Book.generate_code
    @book.releases.build
  end

  def printables
    @book = Book.new(params[:book])

    if @book.save
      # format.html { redirect_to @book, notice: 'Los datos han sido ingresados, muchas gracias!' }

    else
      render action: "new_book_and_release"
    end
  end

  def generate_pdf
    send_data(do_pdf(params[:code]), :filename => "instrucciones.pdf", :type => "application/pdf")
  end

  def index
    @books = Book.all.reverse
  end

  def show
    @book = Book.find(params[:id])
  end

  def show_by_code
    @book = Book.find_by_code(params[:code])
    render partial: 'show'
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Los datos han sido ingresados, muchas gracias!' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @book = Book.find(params[:id])

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
  def do_pdf(code)
    Prawn::Document.new do

      bounding_box([100, 750], :width => 250, :height => 260) do
        # stroke_color 'FFFF00'
        stroke_bounds

        move_down 20
        text "En La Biblioteca Libre", align: :center
        text "creemos que cada libro tiene", align: :center
        text "su magia, pero que se pierde", align: :center
        text "si nadie lo lee.", align: :center
        text "¡Por eso este libro te ha", align: :center
        text "buscado! Dale vida leyéndolo", align: :center
        text "y compartiéndolo.", align: :center
        text "Ingresa el siguiente código", align: :center

        text code, align: :center

        text "en", align: :center
        text "www.labibliotecalibre.cl", align: :center
        text "y así sabremos que está", align: :center
        text "en buenas manos.", align: :center
        text "Recuerda compartirlo", align: :center
        text "cuando lo hayas", align: :center
        text "terminado, :)", align: :center

      end

      bounding_box([100, 450], :width => 250, :height => 120) do
        # stroke_color 'FFFF00'
        stroke_bounds

        move_down 20
        text '¿Qué te pareció el libro?', align: :center
        text 'Cuéntanos más ', align: :center
        text 'ingresando nuevamente ', align: :center
        text 'el código en ', align: :center
        text 'www.labibliotecalibre.cl', align: :center
        text '¡Y comparte el libro!', align: :center
      end

    end.render
  end
end