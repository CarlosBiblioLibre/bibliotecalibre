class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@bibliotecalibre.cl"
  default :to => "hola@catedraslibres.com"

  def new_message(message)
    @message = message
    mail(:subject => "[LaBibliotecaLibre.cl] #{message.subject}")
  end

  def new_message_concurso(message, document)
    @message = message

    p "#"*20
    p "original_filename: " + document.original_filename
    p "#"*20
    p "message #{message}"
    p "#"*20

    attachments[document.original_filename] = document.read # File.read(document.path)

    mail(:subject => "[LaBibliotecaLibre.cl] #{message.subject}")
  end

end