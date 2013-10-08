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
    book = Book.find_by_code(params[:code])
    filename = "#{book.title} #{book.code}"
    filename = sanitize_filename(filename)
    filename = filename[0..30]

    send_data(do_pdf(params[:code]), :filename => filename, :type => "application/pdf")
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

      bounding_box([100, 750], :width => 250, :height => 210) do
        # stroke_color 'FFFF00'
        stroke_bounds

        move_down 20
        text "En la Biblioteca Libre creemos", align: :center
        text "que cada libro tiene su magia,", align: :center
        text "pero que se pierde si nadie lo lee.", align: :center
        text "¡Por eso este libro te ha", align: :center
        text "encontrado! Dale vida leyéndolo y", align: :center
        text "compartiéndolo.", align: :center
        text "Ingresa el siguiente código", align: :center

        text code, align: :center, size: 18

        text "en www.labibliotecalibre.cl y así", align: :center
        text "sabremos que está en buenas", align: :center
        text "manos. Recuerda compartirlo", align: :center
        text "cuando lo hayas terminado :)", align: :center
      end

      bounding_box([100, 500], :width => 250, :height => 120) do
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

  def sanitize_filename(filename)
    filename.strip.tap do |name|
      # NOTE: File.basename doesn't work right with Windows paths on Unix
      # get only the filename, not the whole path
      name.sub! /\A.*(\\|\/)/, ''
      # Finally, replace all non alphanumeric, underscore
      # or periods with underscore
      name.gsub! /[^\w\.\-]/, '_'
    end
  end
end