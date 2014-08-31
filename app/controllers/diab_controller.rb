class DiabController < ApplicationController
  layout 'diab'

  def index
    @book = Book.new
    @book.code = 'DB'+Book.generate_code
    @book.releases.build
    @message = Message.new
  end

  def printables
    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.js {  } # redirect_to @book, notice: 'Los datos han sido ingresados, muchas gracias!'
      end
    end
  end

  def participa
    params[:message][:subject] = "[DiaB] Participa"
    @message = Message.new(params[:message])

    respond_to do |format|
      @bien = true
      if @message.valid?
        NotificationsMailer.new_message(@message).deliver
      else
        @bien = false
      end
      format.js {  }
    end

  end
end
