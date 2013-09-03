class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Mensaje enviado correctamente.")
    else
      flash.now.alert = "Todos los campos son necesarios."
      render :new
    end
  end

  def invitanos
    @message = Message.new
  end

  def invitanos_create
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Mensaje enviado correctamente.")
    else
      flash.now.alert = "Todos los campos son necesarios."
      render :invitanos
    end
  end

end