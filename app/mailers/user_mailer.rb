class UserMailer < ApplicationMailer
    default from: 'santivaz852@hotmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmar_solicitud.subject
  #
  def confirmar_solicitud()
    @greeting = "Hi"

    mail to: "santivaz852@hotmail.com", subject: "solicitud creada"
  end
end
