class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
    
    protected
   # def logued?
    #  if @sesion == nil
     #   return false
     # end
     # return true
   # end
    
    def authorize
      if $sesion == nil
            flash[:error] = "acceso no autorizado"
            redirect_to login_path
            false
        end
    end    
end
