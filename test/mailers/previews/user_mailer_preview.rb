# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/confirmar_solicitud
  def confirmar_solicitud
    UserMailer.confirmar_solicitud
  end

end
