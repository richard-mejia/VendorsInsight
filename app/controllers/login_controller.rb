# -*- coding: utf-8 -*-
class LoginController < ApplicationController
  include LoginHelper
  before_filter :autenticar
  def index	
  end
  
  def autenticar
  end
  
  def create
    sesion = Usuario.autenticar(params[:login][:cedula],params[:login][:clave])
    if sesion
      $sesion = sesion
      if sesion.tipo_usuario.eql? "Vendedor"
      render 'index'
      end
    else
      flash[:danger] = 'Clave o cédula no coinciden'
      render 'autenticar'      
    end
  end

  def destroy
    $sesion = nil
    render 'autenticar'
  end

end
