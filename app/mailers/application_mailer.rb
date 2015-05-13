class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

def get_usuario(id) 
        @usuario = Usuario.find_by(id: id)
      return @usuario
    end
    
end