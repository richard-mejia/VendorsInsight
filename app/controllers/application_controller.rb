class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    helper_method :get_usuario
    protected
    
    def get_usuario(id) 
        @usuario = Usuario.find_by(id: id)
      return @usuario
    end
    def get_attachment(id) 
        @attachment = Attachment.find_by(id: id)
        return @attachment
    end

    def authorize
      unless session[:logueado]
            flash[:error] = "Acceso no autorizado"
            redirect_to login_path
            false
        end
    end

    def authorize_page(sesion,sesion_autorizada)
      if sesion.eql? sesion_autorizada
        return true
      end
      return false
    end
end
