class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@bibliotecalibre.cl"
  default :to => "biblioteca@catedraslibres.com"

  def new_message(message)
    @message = message
    mail(:subject => "[BibliotecaLibre.cl] #{message.subject}")
  end

end
