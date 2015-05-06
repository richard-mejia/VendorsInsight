class UserMailer < ApplicationMailer
    default from: 'vendorsInsight@aplication.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmar_solicitud.subject
  #
  def solicitud_creada(usuario_correo)
    @greeting = "Hola!"
    mail(to: usuario_correo, subject: 'solicitud creada')
     # mail(to: 'sebaslv12@hotmail.com', subject: 'peticion de solicitud')
  end
end
