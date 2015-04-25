class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
    protected

    def get_usuario(id) 
      @usuario = Usuario.find(id)
      return @usuario
    end

    def authorize
      unless session[:logueado]
            flash[:error] = "Acceso no autorizado"
            redirect_to login_path
            false
        end
    end    
end
