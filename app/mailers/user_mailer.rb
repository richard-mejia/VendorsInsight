class UserMailer < ApplicationMailer
    default from: 'from@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmar_solicitud.subject
  #
  def confirmar_solicitud(usuario)
      @usuario = usuario
    @greeting = "Hi"

    mail to: "santivaz852@hotmail.com", subject: "solicitud creada"
  end
end
