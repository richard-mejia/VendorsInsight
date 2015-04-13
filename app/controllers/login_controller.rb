class LoginController < ApplicationController
  def index	
  end
  
  def autenticar
  end
  
  def create
    sesion = Usuario.autenticar(params[:login][:cedula],params[:login][:clave])
    if sesion
      @vendedor = sesion
      render 'index'
    else
      
      render 'autenticar'
    end
  end

  def destroy
  end
  
end
