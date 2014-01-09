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


      cupon_foto = "#{Rails.root}/app/assets/images/cupon1.jpg"

      r = Random.rand(2)
      if r < 1
        cupon_foto = "#{Rails.root}/app/assets/images/cupon2.jpg"
      end

      image cupon_foto, position: :center,
                        vposition: :center,
                        height: 700

      bounding_box([90, 595], :width => 250, :height => 210) do
        text code, align: :center, size: 22
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