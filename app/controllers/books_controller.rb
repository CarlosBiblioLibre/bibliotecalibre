class BooksController < ApplicationController
  before_filter :authenticate_user!, except: [:show_by_code, :check_code, :new_book_and_finding, :show, :create]

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
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
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
end
