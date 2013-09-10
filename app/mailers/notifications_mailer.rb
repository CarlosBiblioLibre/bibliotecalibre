class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@bibliotecalibre.cl"
  default :to => "hola@catedraslibres.com"

  def new_message(message)
    @message = message
    mail(:subject => "[LaBibliotecaLibre.cl] #{message.subject}")
  end

  def new_message_concurso(message, document)
    @message = message

    attachments[document.original_filename] = File.read(document.path)

    mail(:subject => "[LaBibliotecaLibre.cl] #{message.subject}")
  end

end