# encoding: utf-8

require "base64"

class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@bibliotecalibre.cl"
  default :to => "hola@catedraslibres.com"

  def new_message(message)
    @message = message
    mail(:subject => "[LaBibliotecaLibre.cl] #{message.subject}")
  end

  def new_message_concurso(message, document)
    @message = message

    # p "#"*20
    # p "original_filename: " + document.original_filename
    # p "#"*20
    # p "message #{message}"
    # p "#"*20

    if document
      attachments[document.original_filename] = document.read # File.read(document.path)
    end

    #attachments["#{document.original_filename}"] = {
    #  :encoding => 'base64',
    #  :content  => Base64.b64encode(document.read)
    #}

    mail(subject: "[LaBibliotecaLibre.cl] #{message.subject}")
  end

  def new_message_confirmacion(email, nombre)
    @message = Message.new

    @message.email = email
    @message.name = nombre

    mail(to: email, subject: "¡Gracias por participar! ")
  end

end