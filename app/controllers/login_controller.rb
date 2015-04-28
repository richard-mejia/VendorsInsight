# -*- coding: utf-8 -*-
class LoginController < ApplicationController
  include LoginHelper
  before_filter :authorize, :except => [:autenticar, :create]
  
  def index    
  end

  def index_administrador
  end
    
  def index_disenador
  end
  
  def autenticar
  end
  
  def create
    sesion = Usuario.autenticar(params[:login][:cedula],params[:login][:clave])
    if sesion
      session[:usuario_id] = sesion.id
      session[:tipo_usuario] = sesion.tipo_usuario
      session[:logueado] = true
      session[:nombre] = sesion.nombre
      session[:apellido] = sesion.apellido
      session[:correo] = sesion.correo
      if sesion.tipo_usuario.eql? "Vendedor"
        render 'index'
      elsif sesion.tipo_usuario.eql? "Administrador"
        render 'index_administrador'
      elsif sesion.tipo_usuario.eql? "Diseñador Jefe"
          render 'index_disenador'
      end
    else
      flash[:danger] = 'Clave o cédula no coinciden'
      render 'autenticar'      
    end
  end

  def destroy
    session[:logueado] = false
    render 'autenticar'
  end

end
