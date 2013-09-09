class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    params[:message][:subject] = "[Contacto]  #{params[:message][:subject]}"
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
    params[:message][:subject] = "[Invitanos] #{params[:message][:subject]}"
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Mensaje enviado correctamente.")
    else
      flash.now.alert = "Todos los campos son necesarios."
      render :invitanos
    end
  end

  def dona
    @message = Message.new
  end

  def dona_create
    params[:message][:subject] = "[Dona] #{params[:message][:subject]}"
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Mensaje enviado correctamente.")
    else
      flash.now.alert = "Todos los campos son necesarios."
      render :new
    end
  end

  def concurso
    @message = Message.new
  end

  def concurso_create
    params[:message][:subject] = "[Concurso]"
    @message = Message.new(params[:message])

    if @message.valid?
      NotificationsMailer.new_message_concurso(@message, params[:message][:document]).deliver
      redirect_to(root_path, :notice => "Mensaje enviado correctamente.")
    else
      flash.now.alert = "Todos los campos son necesarios."
      render :concurso
    end
  end

end