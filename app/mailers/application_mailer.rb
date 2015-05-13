class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'
    helper_method :get_attachment

def get_usuario(id) 
        @usuario = Usuario.find_by(id: id)
      return @usuario
    end
   
def get_attachment(id) 
        @attachment = Attachment.find_by(id: id)
        return @attachment
    end
    
end