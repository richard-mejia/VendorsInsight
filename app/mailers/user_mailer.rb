# -*- coding: utf-8 -*-
class UserMailer < ApplicationMailer
    default from: 'from@example.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.confirmar_solicitud.subject
  #
    def solicitud_creada(usuario_correo, solicitud)
    @solicitud = solicitud
    @greeting = "Hola"
    mail(to: usuario_correo, subject: 'solicitud creada')
  end
    def solicitud_creada_disenador(correo_disenador, solicitud)
    @solicitud = solicitud
    @greeting = "Hola"
        mail(to: correo_disenador, subject: 'Petición de solicitud')
    end
    def solicitud_aceptar(solicitud)
    @solicitud = solicitud
    @greeting = "Hola"
        mail(to: get_usuario(solicitud.vendedor_id).correo, subject: 'solicitud aceptada')
    end
    def solicitud_rechazar(solicitud,comentario)
    @comentario = comentario
    @solicitud = solicitud
    @greeting = "Hola"
        mail(to: get_usuario(solicitud.vendedor_id).correo, subject: 'solicitud rechazada')
    end
    def solicitud_terminar(solicitud)
    @solicitud = solicitud
    @greeting = "Hola"
        mail(to: get_usuario(solicitud.vendedor_id).correo, subject: 'solicitud terminada')
    end
    def solicitud_entregar(solicitud)
    @solicitud = solicitud
    @greeting = "Hola"
        mail(to: get_usuario(solicitud.vendedor_id).correo, subject: 'solicitud entregada')
    end
end
