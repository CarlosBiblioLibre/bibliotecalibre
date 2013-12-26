# encoding: utf-8

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
    @og_description = "¿Has soñado con tener súper poderes y salvar el mundo? ¿O hacerlo un poquito mejor de lo que es? En la Biblioteca Libre te invitamos a que revivas ese personaje que alguna vez imaginaste, aquel capaz de resolver los problemas de este planeta y combatir a los malvados. Gordos, flacos, chicos, gigantes, musculosos, enmascarados, encapuchados, humanos, alienígenas o mutantes. Todos son parte de este concurso."
    @og_title = "Concurso Literario: Se Busca al Nuevo Superhéroe del Mundo"

    @message = Message.new
  end

  def concurso_create
    params[:message][:subject] = "[Concurso]"
    @message = Message.new(params[:message])


    if @message.valid?
      NotificationsMailer.new_message_concurso(@message, params[:message][:document]).deliver
      NotificationsMailer.new_message_confirmacion(params[:message][:email], params[:message][:name]).deliver
      redirect_to(root_path, :notice => "Hemos recibido tu obra, muchas gracias por participar.")
    else
      flash.now.alert = "Todos los campos son necesarios."

      @og_description = "¿Has soñado con tener súper poderes y salvar el mundo? ¿O hacerlo un poquito mejor de lo que es? En la Biblioteca Libre te invitamos a que revivas ese personaje que alguna vez imaginaste, aquel capaz de resolver los problemas de este planeta y combatir a los malvados. Gordos, flacos, chicos, gigantes, musculosos, enmascarados, encapuchados, humanos, alienígenas o mutantes. Todos son parte de este concurso."
      @og_title = "Concurso Literario: Se Busca al Nuevo Superhéroe del Mundo"
      render :concurso
    end
  end

end