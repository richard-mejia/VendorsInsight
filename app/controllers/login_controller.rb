# -*- coding: utf-8 -*-
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
      flash[:danger] = 'Clave o cédula no coinciden'
      render 'autenticar'      
    end
  end

  def destroy
  end
  
end
